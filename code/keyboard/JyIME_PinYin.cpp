#include "JyIME_PinYin.h"
/**
 * @class   JyIME_PinYin
 * @brief   构造函数
 * @details 继承自QQuickItem,QML控件类，加载字库，对程序提供字库源
 * @athor   luxe
 * @date    20141210
 * @ingroup JyIME
 */
JyIME_PinYin::JyIME_PinYin(QQuickItem *parent) : QQuickItem(parent)
{
    QTextCodec::setCodecForLocale(QTextCodec::codecForName("utf-8"));
  //  Load_Pinyin(BINFILE,"./code.bin");
    Load_Pinyin(TEXTFILE,"F:/hj/learnning/VirtualKeyboard/keyboard/py.txt");
}
/**
 * @class   JyIME_PinYin
 * @brief   加载字库信息对外接口
 * @param   Atype     传递所加载的文件类型
 * @param   Astrfpath 传递加载文件所在的路径
 * @details 字库文件操作类，将字库信息加载到程序中（可读文本字库或者二进制字库）。
 * @athor   luxe
 * @date    20141210
 * @ingroup JyIME
 */
bool JyIME_PinYin::Load_Pinyin(const FILETYPE &Atype,const QString &Astrfpath)
{
    bool bLoad = false;
    if(Atype == TEXTFILE)
        bLoad = LoadFromText(Astrfpath);
    else if(Atype == BINFILE)
        bLoad = LoadFromBin(Astrfpath);

    return bLoad;
}
/**
 * @class   JyIME_PinYin
 * @brief   QML控件属性设置函数
 * @param   Astrkay     传递程序界面接收到的文本
 * @details 根据接收到的文本设置欲在程序界面显示的model值
 * @athor   luxe
 * @date    20141210
 * @ingroup JyIME
 */
void JyIME_PinYin::setText(const QString &AstrKay)
{
    QStringList list =GetContentByKey(AstrKay);
    g_Context->setContextProperty("myModel",QVariant::fromValue(list));
}
/**
 * @class   JyIME_PinYin
 * @brief   查找其他可能匹配索引
 * @param   Astrkay     传递待查索引值
 * @details 根据提供的索引值查找其他可能匹配索引；
 * @details eg：Astrkay = “ab”，返回链表内可能保存“aba”，“abao”，“abu”等等
 * @athor   luxe
 * @date    20141204
 * @ingroup JyIME
 */
QStringList JyIME_PinYin::GetFriendByKey(const QString &Astrkay)
{
    QStringList listFriend;
    QString strkey = Astrkay.trimmed().left(1);
    if( m_Hush.contains(strkey))
    {
       QStringHash::iterator iorCont = m_Hush.find(strkey);
       if(iorCont.value().contains(Astrkay))
       {
         QHash<QString,QStringList>::iterator iorList = iorCont.value().begin();
         for(;iorList != iorCont.value().end();iorList++)
         {
             if(iorList.key().length()>Astrkay.length())
                 listFriend.append(iorList.key());
         }
       }
    }
    return listFriend;
}

/**
 * @class   JyIME_PinYin
 * @brief   查找其可能内容
 * @param   Astrkay     传递待查索引值
 * @details 根据提供的索引值查找其可能内容
 * @details eg：Astrkay = “aba”，返回链表内可能保存“阿爸”，“阿坝”，“阿巴”等等
 * @athor   luxe
 * @date    20141204
 * @ingroup JyIME
 */
QStringList JyIME_PinYin::GetContentByKey(const QString &Astrkay)
{
    QStringList listContent;

    QString strkey = Astrkay.trimmed().left(1);
    if( m_Hush.contains(strkey))
    {
       QStringHash::iterator iorCont = m_Hush.find(strkey);
       if(iorCont.value().contains(Astrkay))
       {
           QHash<QString,QStringList>::iterator iorList = iorCont.value().find(Astrkay);
           listContent = iorList.value();
       }
    }
    qDebug()<<listContent;
    return listContent;
}

/**
 * @class   JyIME_PinYin
 * @brief   加载文本字库
 * @param   Astrfpath    传递文本字库所在路径
 * @details 根据提供的路径加载文本字库，并调用SaveToBin函数将加载信息保存到本地(./code.bin)
 * @athor   luxe
 * @date    20141204
 * @ingroup JyIME
 */
bool JyIME_PinYin::LoadFromText(const  QString &Astrfpath)
{
    bool bLoad = false;
    QFile file(Astrfpath);
    if(file.open(QIODevice::ReadOnly | QIODevice::Text)) //读文本文件
    {
        QTextStream  read(&file);
        QStringList listAll = read.readAll().split("\n");
        int icount=0;
        for(char ch = 'a'; ch<='z';ch++)
        {
             QStringList listKey;
             QString     strKey;
             QHash<QString,QStringList> contentList;
             listKey.clear();
             for(int i=icount;i<listAll.size();i++)
             {
                 if(listAll.at(i).startsWith(QString("%1").arg(ch)))//以当前字母开头
                 {
                    QStringList content= listAll.at(i).split(" ");//以空格分开当前串
                    if(strKey.isEmpty())        //索引为空
                    {
                        strKey =content.at(0).trimmed();//去掉头和尾的空格
                    }
                    else if(!listKey.isEmpty() && !strKey.isEmpty() && strKey != content.at(0).trimmed())
                    {
                        contentList.insert(strKey,listKey);
                        strKey= content.at(0);
                        listKey.clear();
                    }
                    listKey.append(content.at(1).trimmed());
                 }
                 else
                 {
                     contentList.insert(strKey,listKey);
                     strKey.clear();
                     listKey.clear();
                     break;
                 }
                icount++;
             }
             m_Hush.insert(QString("%1").arg(ch),contentList);
        }
        SaveToBin("F:/hj/learnning/VirtualKeyboard/keyboard/code.bin");
        bLoad =true;
    }
    else
        qDebug()<<"文件不存在！";

    return bLoad;
}

/**
 * @class   JyIME_PinYin
 * @brief   保存当前加载的字库信息
 * @param   Astrfpath    传递二进制字库保存的路径
 * @details 根据提供的路径将加载信息保存到本地
 * @athor   luxe
 * @date    20141204
 * @ingroup JyIME
 */
void JyIME_PinYin::SaveToBin(const QString &Astrfpath)
{
    QFile file(Astrfpath);
    file.open(QIODevice::WriteOnly);
    QDataStream write(&file);
    QStringHash::iterator iorCont = m_Hush.begin();
    while(iorCont != m_Hush.end())
    {
        write<<iorCont.key();
        write<<iorCont.value();
        iorCont++;
    }
    file.close();
}

/**
 * @class   JyIME_PinYin
 * @brief   加载二进制文件字库
 * @param   Astrfpath    传递文本字库所在路径
 * @details 根据提供的路径加载二进制字库
 * @athor   luxe
 * @date    20141204
 * @ingroup JyIME
 */
bool JyIME_PinYin::LoadFromBin(const  QString &Astrfpath)
{
    bool bLoad = false;
    QFile file(Astrfpath);
    if(file.open(QIODevice::ReadOnly ))
    {
        QDataStream read(&file);
        while(!read.atEnd())
        {
            QString  strKey;
            QHash<QString,QStringList> hashContent;

            read>>strKey;
            read>>hashContent;
            m_Hush.insert(strKey,hashContent);
        }
        bLoad = true;
    }
    else
        qDebug()<<"文件不存在！";

    return bLoad;
}
