#include "serial.h"
#include<QDebug>
#include <QMessageBox>

#ifdef USE_QSerialPort
Serial::Serial()
{
//    connect(this,SIGNAL(error(QSerialPort::SerialPortError)), this,
//                     SLOT(handleError(QSerialPort::SerialPortError)));
    connect(this, SIGNAL(readyRead()), this, SLOT(readData()));
   // connect(console, SIGNAL(getData(QByteArray)), this, SLOT(writeData(QByteArray)));
 //   updateSettings(1,3,3,0,0,0);
 //  openSerialPort();
}

Serial::~Serial()
{

}
Serial::Settings Serial::settings() const
{
    return currentsetting;
}
void Serial::openSerialPort()
{
    Settings  p = settings();
    setPortName(p.name);
    setBaudRate(p.baudRate);
    setDataBits(p.dataBits);
    setParity(p.parity);
    setStopBits(p.stopBits);
    setFlowControl(p.flowControl);
    if (open(QIODevice::ReadWrite)) {
        qDebug()<<"set sucess";
    } else {
        qDebug()<<"Error:s%"<<errorString();
     }
}
void Serial::closeSerialPort() {
    close();
}
void Serial::updateSettings(int PortNameIndex,int BaudRateIndex, int DatabitsIndex,int ParityIndex, int StopbitsIndex,int FlowcontrolIndex) {
    //得到当前端口名
 //  QString allname[6]={"COM11","COM2","COM3","COM4","COM5","COM6"};//列举所有的端口名
 //  QString allname[6]={"ttyUSB0","ttyUSB1","ttyUSB2","ttyUSB3","ttyUSB4","ttyUSB5"};//列举所有的端口名
   QString allname[6]={"ttymxc2","ttymxc2","ttymxc3","ttymxc4","ttymxc5","ttymxc6"};//列举所有的端口名
   currentsetting.name=allname[PortNameIndex];
//    std::cout<<" ok setPortName to "+ currentsetting.name.toStdString()<< std::endl;//通过输出来验证设定成功

    //得到当前波特率
    qint32 allbauRate[4]={9600,19200,38400,115200};
    currentsetting.baudRate=allbauRate[BaudRateIndex];

    //得到当前发送位数
    QSerialPort::DataBits allDatabits[4]={QSerialPort::Data5,
                                          QSerialPort::Data6,
                                          QSerialPort::Data7,
                                          QSerialPort::Data8};
    currentsetting.dataBits=allDatabits[DatabitsIndex];

    //得到当前Parity
    QSerialPort::Parity allparity[5]={QSerialPort::NoParity,
                                      QSerialPort::OddParity,
                                      QSerialPort::EvenParity,
                                      QSerialPort::MarkParity,
                                      QSerialPort::SpaceParity};
    currentsetting.parity=allparity[ParityIndex];

    //得到当前停止位
    QSerialPort::StopBits allstopBits[3]={QSerialPort::OneStop,
                                          QSerialPort::OneAndHalfStop,
                                          QSerialPort::TwoStop};
    currentsetting.stopBits=allstopBits[StopbitsIndex];

    //得到当前FlowControl
    QSerialPort::FlowControl allflowControl[3]={QSerialPort::NoFlowControl,
                                                QSerialPort::HardwareControl,
                                                QSerialPort::SoftwareControl};
    currentsetting.flowControl=allflowControl[FlowcontrolIndex];

}
void Serial::writeData(QString sendmessage)
{
    QByteArray data = sendmessage.toLocal8Bit();//+'\r
    write(data);
}
void Serial::readData()
{
    QByteArray data = readAll();
    QString revdata=data.data();
    if(revdata.contains('%', Qt::CaseInsensitive)){
      m_revdata.clear();
    }
    m_revdata=m_revdata+revdata;
    if(revdata.contains('\r', Qt::CaseInsensitive)){

      emit revdataChanged();//发送消息触发revdata()
    }
   // qDebug("readBufferSize: %d", readBufferSize());
    // qDebug()<<"revdata:%d"<<readBufferSize();


}
void Serial::handleError(QSerialPort::SerialPortError error)
{
    if (error == QSerialPort::ResourceError) {
        qDebug()<<"SerialPortError:s%"<<errorString();
        closeSerialPort();
    }
}
QString Serial::revdata()
{
    return m_revdata;
   // qDebug()<<"m_revdata:s%"<<m_revdata;
}

void Serial::setrevdata(const QString revdata){
    m_revdata=revdata;
   // revdataChanged();
}
void Serial::clearRevdata(){
    m_revdata.clear();
}
#else
Serial::Serial()
{
//    connect(this,SIGNAL(error(QSerialPort::SerialPortError)), this,
//                     SLOT(handleError(QSerialPort::SerialPortError)));
    connect(this, SIGNAL(readyRead()), this, SLOT(readData()));
   // connect(console, SIGNAL(getData(QByteArray)), this, SLOT(writeData(QByteArray)));
 //   updateSettings(1,3,3,0,0,0);
 //  openSerialPort();
}

Serial::~Serial()
{

}
Serial::Settings Serial::settings() const
{
    return currentsetting;
}
void Serial::openSerialPort()
{
    Settings  p = settings();
#ifdef Q_OS_LINUX
    setPortName("/dev/"+p.name);
#elif defined (Q_OS_WIN)
    setPortName(p.name);
#endif
    setBaudRate(p.baudRate);
    setDataBits(p.dataBits);
    setParity(p.parity);
    setStopBits(p.stopBits);
    setFlowControl(p.flowControl);
    setTimeout(TIME_OUT);
    if (open(QIODevice::ReadWrite)) {
        qDebug()<<p.name<<"set sucess";
    } else {
        qDebug()<<p.name<<"Error: "<<errorString();
     }
}
void Serial::closeSerialPort(){
    close();
}
void Serial::updateSettings(int PortNameIndex,int BaudRateIndex, int DatabitsIndex,int ParityIndex, int StopbitsIndex,int FlowcontrolIndex)
{
    //得到当前端口名
   // QString allname[6]={"COM12","COM2","COM3","COM4","COM5","COM6"};//列举所有的端口名
   //   QString allname[6]={"ttyUSB0","ttyUSB1","ttyUSB2","ttyUSB3","ttyUSB4","ttyUSB5"};//列举所有的端口名
      QString allname[6]={"ttymxc2","ttymxc2","ttymxc3","ttymxc4","ttymxc5","ttymxc6"};//列举所有的端口名
   currentsetting.name=allname[PortNameIndex];
//    std::cout<<" ok setPortName to "+ currentsetting.name.toStdString()<< std::endl;//通过输出来验证设定成功

    //得到当前波特率
    BaudRateType allbauRate[4]={BAUD9600,BAUD19200,BAUD38400,BAUD115200};
    currentsetting.baudRate=allbauRate[BaudRateIndex];

    //得到当前发送位数
   DataBitsType  allDatabits[4]={DATA_5,DATA_6,DATA_7,DATA_8};

    currentsetting.dataBits=allDatabits[DatabitsIndex];

    //得到当前Parity
    ParityType allparity[5]={PAR_NONE,PAR_ODD, PAR_EVEN,PAR_MARK,PAR_SPACE,};
    currentsetting.parity=allparity[ParityIndex];

    //得到当前停止位
    StopBitsType allstopBits[3]={STOP_1,STOP_1_5,STOP_2};

    currentsetting.stopBits=allstopBits[StopbitsIndex];

    //得到当前FlowControl
   FlowType allflowControl[3]={FLOW_OFF,FLOW_HARDWARE, FLOW_XONXOFF};
    currentsetting.flowControl=allflowControl[FlowcontrolIndex];

}

void Serial::writeData(QString sendmessage)
{
    QByteArray data = sendmessage.toLocal8Bit();//+'\r
    write(data);
}
void Serial::readData()
{
    QByteArray data = readAll();
    QString revdata=data.data();
    if(revdata.contains('%', Qt::CaseInsensitive)){
      m_revdata.clear();
    }
    m_revdata=m_revdata+revdata;
    if(revdata.contains('\r', Qt::CaseInsensitive)){

      emit revdataChanged();//发送消息触发revdata()
    }
   // qDebug("readBufferSize: %d", readBufferSize());
    // qDebug()<<"revdata:%d"<<readBufferSize();
}
//void Serial::handleError(QSerialPort::SerialPortError error)
//{
//    if (error == QSerialPort::ResourceError) {
//        qDebug()<<"SerialPortError:s%"<<errorString();
//        closeSerialPort();
//    }
//}
QString Serial::revdata()
{
    return m_revdata;
   // qDebug()<<"m_revdata:s%"<<m_revdata;
}

void Serial::setrevdata(const QString revdata){
    m_revdata=revdata;
   // revdataChanged();
}
void Serial::clearRevdata(){
    m_revdata.clear();
}
#endif
