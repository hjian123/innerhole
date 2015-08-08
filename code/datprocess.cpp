/*******************************************************************************************************
 * 2015/6/3:将页面数据处理的过程都放到C++文件中，留出接口到qml文件，这样便于使用C++当中定义的宏
*******************************************************************************************************/
#include "datprocess.h"
#include<QDebug>

Datprocess::Datprocess(QObject *parent) : QObject(parent)
{

}

Datprocess::~Datprocess()
{

}
int Datprocess::checkPacket(const QString &revdata)
{
    QString tmp;
    tmp = revdata;
    int i=0,j=0;
    i=tmp.indexOf('%'); //查找'%'在QString对应的位置,返回下标
    if(i==-1) return -1;
    else{
            if(tmp.at(i+1)==AD_H) ;//at方法可以读取QString对应下标的内容,注意只能读取,不能改写,改写的话可以使用tmp[i]
             else return -1;
            if(tmp.at(i+2)==AD_L) ;
             else return -1;
            if(tmp.at(i+3)=='$') ;
             else return -1;
            j=tmp.indexOf(0x0d);
            if(j==-1) return -1;
            else{
                m_RevBuf=tmp.left(j+1);//left方法将tmp左起j+1个内容提取出来,类似方法还有right
                m_RevBuf=m_RevBuf.remove(0,i+6);//remove方法移除相应的内容,第一个参数为移除起始位置,第二个参数为移除的数量
                emit revbufChanged();
                return 0;
            }
    }
}
QString Datprocess::SendBuf()
{
    return m_SendBuf;
}
void Datprocess::setSendBuf(const QString &cmd)
{
    m_SendBuf=cmd;
    emit sendbufChanged();
}
QString Datprocess::RevBuf()
{
    return m_RevBuf;
}
void Datprocess::setRevBuf(const QString &cmd)
{
    m_RevBuf=cmd;
    emit revbufChanged();
}
QString Datprocess::cov0x2string(const char &p_tmp)//将16进制转换成字符
{
    QString str;
    char tmp= p_tmp;
    char h_tmp=tmp>>4&0x0F;
    char l_tmp=tmp&0x0F;
    if(h_tmp<10) h_tmp=h_tmp+'0';
    else h_tmp=h_tmp-10+'A';
    if(l_tmp<10) l_tmp=l_tmp+'0';
    else l_tmp=l_tmp-10+'A';
    str.append(QString(h_tmp));
    str.append(QString(l_tmp));
    return str;
}
QString Datprocess::selectnchar(int position, int n)
{
    QString tmp;
    tmp = m_RevBuf.mid(position,n);

    return tmp;
}
int Datprocess::covstring20x(const QString &str)//将字符转换成16进制，包含大小端变化
{
    int tmp1[4]={0};
    QString tmp2=str;
    unsigned char i=0;
    for(i=0;i<4;i++){
        if(tmp2[i].toLatin1()>='A') tmp1[i]=tmp2[i].toLatin1()-'A'+10;
        else tmp1[i]=tmp2[i].toLatin1()-'0';
       //  //qDebug()<<tmp1[i]<<"\n";
    }
    return tmp1[0]<<4|tmp1[1]|tmp1[2]<<12|tmp1[3]<<8;
}
void Datprocess::fillsend32buf(const QString &cmd,const QString &addr1, const QString &addr2,const qint16 &ldata, const qint16 &hdata)
{
    QString str;
    str=cmd;
    str.append(addr1);
    str.append(addr2);
    str.append(cov0x2strings(ldata));
    str.append(cov0x2strings(hdata));
    setSendBuf(str);
    qDebug()<<str;
}

void Datprocess::fillsend16buf(const QString &cmd,const QString &addr, const qint16 &data)
{
    QString str;
    str=cmd;
    str.append(addr);
    str.append(addr);
    str.append(cov0x2strings(data));
    setSendBuf(str);
    qDebug()<<str;
}

void Datprocess::fillsendbitbuf(const QString &cmd,const QString &addr, const QString &data)
{
    QString str;
    str=cmd;
    str.append(addr);
    str.append(data);
    setSendBuf(str);
}
QString Datprocess::cov0x2strings(const qint16 &p_tmp)
{
    QString str;
    qint16 tmp= p_tmp;
    char h_tmp=(char)(tmp>>8)&0xFF;
    char l_tmp=(char)tmp&0xFF;

    str = cov0x2string(l_tmp);
    str.append(cov0x2string(h_tmp));

    return str;
}
void Datprocess::ctlmenuroot_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RDD";
                str.append(FTTH);
                str.append(TIME);
                setSendBuf(str);
                break;
        case 1: str="RDD";
                str.append(SCNT_L);
                str.append(SCNT_L);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(POLL);
                str.append(MAIV);
                setSendBuf(str);
                break;
        case 3: str="RDD";
                str.append(CCNT);
                str.append(CCNT);
                setSendBuf(str);
                break;
        case 4: str="RCCR";
                str.append(MSG2);
                str.append(MSG2);
                setSendBuf(str);
                break;
       // case 5: str="RCCR";
               // str.append("WR0002");
               // str.append(MSG2_H);
           //     setSendBuf(str);
           //     break;
        default: break;
    }
}
void Datprocess::manualpage_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCCR";
                str.append(MANUALR11);
                str.append(MANUALR12);
                setSendBuf(str);
                break;
        case 1: str="RCSR";
                str.append(MANUALR40);
                setSendBuf(str);
                break;
    default:break;
   }
}
void Datprocess::warncheckpage_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(RESETEN);
                setSendBuf(str);
                break;
    default:break;
        }
}
void Datprocess::autopage_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(RESETEN);
                setSendBuf(str);              
                break;
        case 1: str="RCSR";
                str.append(AUTR);
                setSendBuf(str);
                break;
        case 2: str="RCSR";
                str.append(RUNR);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(RESET);
                setSendBuf(str);
                break;
        case 4: str="RCSR";
                str.append(GORG);
                setSendBuf(str);
                break;
        case 5: str="RCSR";
                str.append(STIP);
                setSendBuf(str);
                break;
        case 6: str="RCSR";
                str.append(ISPY);
                setSendBuf(str);
                break;
        case 7: str="RCSR";
                str.append(IBOX);
                setSendBuf(str);
                break;
        case 8: str="RCSR";
                str.append(ULAD);
                setSendBuf(str);
                break;
        case 9: str="RCSR";
                str.append(TOOL);
                setSendBuf(str);
                break;
        case 10: str="RCSR";
                str.append(GRND);
                setSendBuf(str);
                break;
        case 11: str="RCSR";
                str.append(MIN);
                setSendBuf(str);
                break;
        case 12: str="RCSR";
                str.append(PRLD);
                setSendBuf(str);
                break;
        case 13: str="RDD";
                str.append(STATE);
                str.append(BKWR);
                setSendBuf(str);
                break;
        case 14: str="RDD";
                str.append(CCNT);
                str.append(CCNT);
                setSendBuf(str);
                break;
        case 15: str="RCCR";
                str.append(MSG2);
                str.append(MSG2);
                setSendBuf(str);
                break;
        default: break;
    }
}

void Datprocess::devsetroot_pollcmd(int index)
{

}

void Datprocess::monitortab2_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCST";
                str.append(CHAXIN_READ);
                setSendBuf(str);
              //  qDebug()<<"devset1_pollcmd:0 ";
                break;
        case 1: str="RCST";
                str.append(FB180_READ);
                setSendBuf(str);
                break;
        case 2: str="RCST";
                str.append(UPLOAD_READ);
                setSendBuf(str);
                break;
        case 3: str="RCCR";
                str.append(CURLOCCATION1);
                str.append(CURLOCCATION4);
               // str.append(LEFT_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RDD";
                str.append(CURPOS1);
                str.append(CURPOS4);
                setSendBuf(str);
                break;
        case 5: str="RCSR";
                str.append(ORGSTATE);
                setSendBuf(str);
                break;
        case 6: str="RCSR";
                str.append(QGORG);
                setSendBuf(str);
                break;
        case 7: str="RCCY";
                str.append(YSTART);
                str.append(YEND);
                setSendBuf(str);
                break;
        case 8: str="RCCX";
                str.append(XSTART);
                str.append(XEND);
                setSendBuf(str);
                break;
        case 9: str="RCCX";
                str.append(XSTART1);
                str.append(XEND1);
                setSendBuf(str);
                break;
        case 10: str="RCCX";
                str.append(YSTART2);
                str.append(YEND2);
                setSendBuf(str);
                break;
        default: break;
    }

}

void Datprocess::monitortab3_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCCL";
                str.append(SETZERO);
                str.append(SETZERO);
                setSendBuf(str);
                break;
        case 1: str="RDD";
                str.append(OUTPUTSET);
                str.append(OUTPUTSET);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(OKOUTPUTSET);
                str.append(REPAIRSET);
                setSendBuf(str);
                break;
        case 3: str="RDD";
                str.append(OKOUTPUT);
                str.append(OUTPUT);
                setSendBuf(str);
                break;
        case 4: str="RDD";
                str.append(MONTH);
                str.append(YEAR);
                setSendBuf(str);
                break;
        default: break;
    }
}

void Datprocess::monitortab1_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RDD";
                str.append(STATE);
                str.append(TIMER);
                setSendBuf(str);
              //  qDebug()<<"devset1_pollcmd:0 ";
                break;
        case 1: str="RDD";
                str.append(DT30046);
                str.append(DT30046);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(OUTPUT);
                str.append(CHUANSI);
                setSendBuf(str);
                break;
        case 3: str="RCCR";
                str.append(POSTION1);
                str.append(POSTION4);
               // str.append(LEFT_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RCCX";
                str.append(XSTART);
                str.append(XEND);
                setSendBuf(str);
                break;
        case 5: str="RCCY";
                str.append(YSTART);
                str.append(YEND);
                setSendBuf(str);
                break;
        case 6: str="RCCY";
                str.append(YSTART1);
                str.append(YEND1);
                setSendBuf(str);
                break;
        case 7: str="RCSR";
                str.append(RELOAD_READ);
         //       str.append(LEFT_SLTP);
                setSendBuf(str);
           //     qDebug()<<"devset1_pollcmd:7 ";
                break;
        default: break;
    }
}

void Datprocess::helpfilepage_pollcmd(int index)
{


}

void Datprocess::devset1_pollcmd(int index)//学习左旋轮设定
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(LEFT_DACFMEN);
                setSendBuf(str);
              //  qDebug()<<"devset1_pollcmd:0 ";
                break;
        case 1: str="RCSR";
                str.append(LEFT_ADJEN);
                setSendBuf(str);
                break;
        case 2: str="RCCL";
                str.append(LEFT_DACFM);
                str.append(LEFT_MINUS);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(LEFT_SFTR);
               // str.append(LEFT_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RCSR";
               // str.append(LEFT_SFTR);
                str.append(LEFT_BKORGR);
                setSendBuf(str);
                break;
        case 5: str="RDD";
                str.append(LEFT_SETV);
                str.append(LEFT_STEPV);
                setSendBuf(str);
                break;
        case 6: str="RDD";
                str.append(LEFT_CNTV);
                str.append(LEFT_CNTVH);
                setSendBuf(str);
                break;
        case 7: str="RDD";
                str.append(LEFT_SLTP);
                str.append(LEFT_SLTP);
                setSendBuf(str);
           //     qDebug()<<"devset1_pollcmd:7 ";
                break;
        default: break;
    }
}

void Datprocess::leftmotor_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(LEFT_DACFMEN);
                setSendBuf(str);
                //qDebug()<<"leftmotor_pollcmd:0 ";
                break;
        case 1: str="RCSR";
                str.append(LEFT_EN);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(LEFT_ORG);
                str.append(LEFT_ICORE);
                setSendBuf(str);
                break;
        case 3: str="RDD";
                str.append(LEFT_MAN);
                str.append(LEFT_BKORG);
                setSendBuf(str);
                //qDebug()<<"leftmotor_pollcmd:3 ";
                break;
        default: break;
    }

}

void Datprocess::devset2_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(MAIN_DACFMEN);
                setSendBuf(str);
                //qDebug()<<"devset2_pollcmd:0 ";
                break;
        case 1: str="RCSR";
                str.append(MAIN_ADJEN);
                setSendBuf(str);
                break;
        case 2: str="RCCL";
                str.append(MAIN_DACFM);
                str.append(MAIN_MINUS);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(MAIN_SFTR);
              //  str.append(MAIN_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RCSR";
              //  str.append(MAIN_SFTR);
                str.append(MAIN_BKORGR);
                setSendBuf(str);
                break;
        case 5: str="RDD";
                str.append(MAIN_SETV);
                str.append(MAIN_STEPV);
                setSendBuf(str);
                break;
        case 6: str="RDD";
                str.append(MAIN_CNTV);
                str.append(MAIN_CNTVH);
                setSendBuf(str);
                break;
        case 7: str="RDD";
                str.append(MAIN_SLTP);
                str.append(MAIN_SLTP);
                setSendBuf(str);
                //qDebug()<<"devset2_pollcmd:7 ";
                break;
        default: break;
    }

}

void Datprocess::mainshift_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(MAIN_EN);
                setSendBuf(str);
                //qDebug()<<"mainshift_pollcmd:0 ";
                break;
        case 1: str="RDD";
                str.append(MAIN_SAFE);
                str.append(MAIN_AMP);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(MAIN_MAN);
                str.append(MAIN_BKORG);
                setSendBuf(str);
                break;
        case 3: str="RDD";
                str.append(MAIN_SPEED);
                str.append(MAIN_SPEED);
                setSendBuf(str);
                //qDebug()<<"mainshift_pollcmd:3 ";
                break;
        default: break;
    }
}

void Datprocess::devset3_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(RIGHT_DACFMEN);
                setSendBuf(str);
                //qDebug()<<"devset3_pollcmd:0 ";
                break;
        case 1: str="RCSR";
                str.append(RIGHT_ADJEN);
                setSendBuf(str);
                break;
        case 2: str="RCCL";
                str.append(RIGHT_DACFM);
                str.append(RIGHT_MINUS);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(RIGHT_SFTR);
               // str.append(RIGHT_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RCSR";
               // str.append(RIGHT_SFTR);
                str.append(RIGHT_BKORGR);
                setSendBuf(str);
                break;
        case 5: str="RDD";
                str.append(RIGHT_SETV);
                str.append(RIGHT_STEPV);
                setSendBuf(str);
                break;
        case 6: str="RDD";
                str.append(RIGHT_CNTV);
                str.append(RIGHT_CNTVH);
                setSendBuf(str);
                break;
        case 7: str="RDD";
                str.append(RIGHT_SLTP);
                str.append(RIGHT_SLTP);
                setSendBuf(str);
                //qDebug()<<"devset3_pollcmd:7 ";
                break;
        default: break;
    }
}

void Datprocess::rightmotor_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(RIGHT_DACFMEN);
                setSendBuf(str);
                //qDebug()<<"rightmotor_pollcmd:0 ";
                break;
        case 1: str="RCSR";
                str.append(RIGHT_EN);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(RIGHT_ORG);
                str.append(RIGHT_AMP);
                setSendBuf(str);
                break;
        case 3: str="RDD";
                str.append(RIGHT_MAN);
                str.append(RIGHT_BKORG);
                setSendBuf(str);
                break;
        case 4: str="RDD";
                str.append(RIGHT_SCANTIME);
                str.append(RIGHT_SCANTIME);
                setSendBuf(str);
                break;
        case 5: str="RDD";
                str.append(RIGHT_MIXTIME);
                str.append(RIGHT_MIXTIME);
                setSendBuf(str);
                break;
        case 6: str="RDD";
                str.append(RIGHT_M1);
                str.append(RIGHT_M1);
                setSendBuf(str);
                break;
        case 7: str="RDD";
                str.append(RIGHT_M2);
                str.append(RIGHT_M2);
                setSendBuf(str);
                //qDebug()<<"rightmotor_pollcmd:7 ";
                break;
        default: break;
    }

}

void Datprocess::devset4_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(WIRE_DACFMEN);
                setSendBuf(str);
                //qDebug()<<"devset4_pollcmd:0";
                break;
        case 1: str="RCSR";
                str.append(WIRE_ADJEN);
                setSendBuf(str);
                break;
        case 2: str="RCCL";
                str.append(WIRE_DACFM);
                str.append(WIRE_MINUS);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(WIRE_SFTR);
               // str.append(WIRE_BKORGR);
                setSendBuf(str);
                break;
        case 4: str="RCSR";
               // str.append(WIRE_SFTR);
                str.append(WIRE_BKORGR);
                setSendBuf(str);
                break;
        case 5: str="RDD";
                str.append(WIRE_SETV);
                str.append(WIRE_STEPV);
                setSendBuf(str);
                break;
        case 6: str="RDD";
                str.append(WIRE_CNTV);
                str.append(WIRE_CNTVH);
                setSendBuf(str);
                break;
        case 7: str="RDD";
                str.append(WIRE_SLTP);
                str.append(WIRE_SLTP);
                setSendBuf(str);
                //qDebug()<<"devset4_pollcmd:7";
                break;
        default: break;
    }
}

void Datprocess::wire_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(WIRE_EN);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:0";
                break;
        case 1: str="RDD";
                str.append(WIRE_MOUTH);
                str.append(WIRE_BREAK);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(WIRE_MAN);
                str.append(WIRE_STIPV);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        default: break;
    }

}

void Datprocess::devset5_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(CONSET_EN);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:0";
                break;
        case 1: str="RDD";
                str.append(CONSET_NOPASS);
                str.append(CONSET_LOWRES);
                setSendBuf(str);
                break;
        case 2: str="RDD";
                str.append(CONSET_RESTRYMAX);
                str.append(CONSET_RESTRYMAX);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 3: str="RDD";
                str.append(CONSET_BACKFORTH1);
                str.append(CONSET_CONENOW);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 4: str="RDD";
                str.append(CONSET_SGTIME);
                str.append(CONSET_RESNOW);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 5: str="RDD";
                str.append(CONSET_RESBKV);
                str.append(CONSET_2COMPV);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 6: str="RDD";
                str.append(CONSET_HOTCUTTIME);
                str.append(CONSET_MOD1V2);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 7: str="RDD";
                str.append(CONSET_WORKVM2);
                str.append(CONSET_2COMP);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 8: str="RDD";
                str.append(CONSET_WM1LEN);
                str.append(CONSET_VM1COMP);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        case 9: str="RDD";
                str.append(CONSET_CLIPTIME);
                str.append(CONSET_180CONF);
                setSendBuf(str);
                //qDebug()<<"wire_pollcmd:2";
                break;
        default: break;
    }
}

void Datprocess::devset7_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RCSR";
                str.append(HIGHSET_EN);
                setSendBuf(str);
                break;
        case 1: str="RCSR";
                str.append(HIGHSET_COMBOXEN);
                setSendBuf(str);
                break;
        case 2: str="RCSR";
                str.append(HIGHSET_SAFEDOOR);
                setSendBuf(str);
                break;
        case 3: str="RCSR";
                str.append(HIGHSET_SOURCE);
                setSendBuf(str);
                break;
        case 4: str="RDD";
                str.append(CONSET_COMBOX1);
                str.append(CONSET_COMBOX2);
                setSendBuf(str);
                break;
        default: break;
    }
}

void Datprocess::devset6_pollcmd(int index)
{
    QString str;
    switch (index){
        case 0: str="RDD";
            str.append(ALG_PUSH);
            str.append(ALG_MAINV);
            setSendBuf(str);
                //qDebug()<<"wire_pollcmd:0";
                break;
        default: break;
    }
}


QString Datprocess::makeDataPack()
{
       QString datasent;
       int i;
       char tmp=0;
       datasent[0]='%';
       datasent[1]=AD_H;
       datasent[2]=AD_L;
       datasent[3]='#';
       datasent.append(m_SendBuf);
       tmp=datasent[0].toLatin1();
       for(i=0;i<datasent.size()-1;i++){
           tmp^=datasent[i+1].toLatin1();
       }
      datasent.append(cov0x2string(tmp));
      datasent.append(0x0d);
    //  Q_CHECK_PTR(datasent);
 //    qDebug()<<"DataPack: "<<datasent;
       return datasent;
}
