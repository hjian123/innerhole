#ifndef DATPROCESS_H
#define DATPROCESS_H

#include <QObject>
#include "global.h"

class Datprocess : public QObject
{
    Q_OBJECT
       Q_PROPERTY(QString SendBuf READ SendBuf WRITE setSendBuf NOTIFY sendbufChanged)
       Q_PROPERTY(QString RevBuf READ RevBuf WRITE setRevBuf NOTIFY revbufChanged)
 //      Q_PROPERTY(bool RevReady READ RevReady WRITE )
public:
    explicit Datprocess(QObject *parent = 0);
    ~Datprocess();
    QString SendBuf();
    QString RevBuf();
 //   bool RevReady();
    void setSendBuf(const QString &cmd);
    void setRevBuf(const QString &cmd);
//    void setRevReady(const bool &RevReady);
    Q_INVOKABLE int checkPacket(const QString &revdata);
    Q_INVOKABLE QString makeDataPack();
    Q_INVOKABLE QString selectnchar(int position,int n);
    Q_INVOKABLE int covstring20x(const QString &str);
    Q_INVOKABLE void fillsend32buf(const QString &cmd,const QString &addr1,const QString &addr2,const qint16 &ldata,const qint16 &hdata);
    Q_INVOKABLE void fillsend16buf(const QString &cmd,const QString &addr,const qint16 &data);
    Q_INVOKABLE void fillsendbitbuf(const QString &cmd,const QString &addr,const QString &data);

    Q_INVOKABLE QString cov0x2strings(const qint16 &p_tmp);//将一个字的十六进制码转换成4个字符，并变成小端模式如0x1234编程'3'、‘4’、'1'、‘2’

    Q_INVOKABLE void ctlmenuroot_pollcmd(int index);
    Q_INVOKABLE void manualpage_pollcmd(int index);
    Q_INVOKABLE void autopage_pollcmd(int index);
    Q_INVOKABLE void devsetroot_pollcmd(int index);
    Q_INVOKABLE void monitortab1_pollcmd(int index);
    Q_INVOKABLE void monitortab2_pollcmd(int index);
    Q_INVOKABLE void monitortab3_pollcmd(int index);
    Q_INVOKABLE void warncheckpage_pollcmd(int index);
    Q_INVOKABLE void helpfilepage_pollcmd(int index);
    Q_INVOKABLE void devset1_pollcmd(int index);
    Q_INVOKABLE void leftmotor_pollcmd(int index);
    Q_INVOKABLE void devset2_pollcmd(int index);
    Q_INVOKABLE void mainshift_pollcmd(int index);
    Q_INVOKABLE void devset3_pollcmd(int index);
    Q_INVOKABLE void rightmotor_pollcmd(int index);
    Q_INVOKABLE void devset4_pollcmd(int index);
    Q_INVOKABLE void wire_pollcmd(int index);
    Q_INVOKABLE void devset5_pollcmd(int index);
    Q_INVOKABLE void devset6_pollcmd(int index);
    Q_INVOKABLE void devset7_pollcmd(int index);


signals:
    void sendbufChanged();
    void revbufChanged();
public slots:
private:
    QString cov0x2string(const char &p_tmp);//将ASCII码转换成两个字符，如0x1A编程'0'和‘A’

    QString m_SendBuf;
    QString m_RevBuf;
    //   bool m_RevReady;
};



#endif // DATPROCESS_H
