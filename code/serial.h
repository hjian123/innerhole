#ifndef SERIAL_H
#define SERIAL_H
#define TIME_OUT 10
#define USE_QSerialPort
#include <QObject>
#ifdef USE_QSerialPort
#include <QtSerialPort/QSerialPort>
#else
#include "qextserial/qextserialport.h"
#endif
QT_BEGIN_NAMESPACE

#ifdef USE_QSerialPort
class Serial : public QSerialPort
{
    Q_OBJECT
    Q_PROPERTY(QString revdata READ revdata  WRITE setrevdata NOTIFY revdataChanged)
public:
   Serial();
    ~Serial();
   Q_INVOKABLE void updateSettings(int PortNameIndex,
                                                                int BaudRateIndex,
                                                                int DatabitsIndex,
                                                                int ParityIndex,
                                                                int StopbitsIndex,int FlowcontrolIndex);
    Q_INVOKABLE void openSerialPort();
    Q_INVOKABLE void closeSerialPort();
    Q_INVOKABLE void writeData(QString sendmessage);
    Q_INVOKABLE void clearRevdata();

   struct Settings {//端口设定结构体
       QString name;
       qint32 baudRate;
       QSerialPort::DataBits dataBits;
       QSerialPort::Parity parity;
       QSerialPort::StopBits stopBits;
       QSerialPort::FlowControl flowControl;
   };
    QString revdata(void);
    void setrevdata(const QString revdata);
     Settings settings() const;
signals:
    void revdataChanged();

public slots:
    void readData();
    void handleError(QSerialPort::SerialPortError error);
private:
    Settings currentsetting;  
    QString m_revdata;
};
#else
class Serial : public QextSerialPort
{
    Q_OBJECT
    Q_PROPERTY(QString revdata READ revdata  WRITE setrevdata NOTIFY revdataChanged)
public:
   Serial();
    ~Serial();
   Q_INVOKABLE void updateSettings(int PortNameIndex,
                                                                int BaudRateIndex,
                                                                int DatabitsIndex,
                                                                int ParityIndex,
                                                                int StopbitsIndex,int FlowcontrolIndex);
    Q_INVOKABLE void openSerialPort();
    Q_INVOKABLE void closeSerialPort();
    Q_INVOKABLE void writeData(QString sendmessage);
    Q_INVOKABLE void clearRevdata();
   struct Settings {//端口设定结构体
       QString name;
       QueryMode queryMode;
       BaudRateType baudRate;
       DataBitsType dataBits;
       ParityType parity;
       StopBitsType stopBits;
       FlowType flowControl;
   };

    QString revdata(void);
    void setrevdata(const QString revdata);
    Settings settings() const;
signals:
    void revdataChanged();

public slots:
    void readData();
    //void handleError(QSerialPort::SerialPortError error);
private:
    Settings currentsetting;
    QString m_revdata;
};
#endif
#endif // SERIAL_H
