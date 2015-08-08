#ifndef JYIME_PINYIN_H
#define JYIME_PINYIN_H

#include <QQuickItem>
#include <QQmlContext>
#include <QTextCodec>
#include <QDebug>
#include <QFile>

typedef QHash<QString,QHash<QString,QStringList> >  QStringHash;

enum FILETYPE{
    TEXTFILE,
    BINFILE
};

extern QQmlContext  *g_Context;

class JyIME_PinYin : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QString text READ getText WRITE setText NOTIFY textChanged)

public:
    explicit JyIME_PinYin(QQuickItem *parent = 0);
    bool Load_Pinyin(const FILETYPE &Atype,const QString &Astrfpath);
    QStringList  GetFriendByKey (const QString &Astrkay);
    QStringList  GetContentByKey(const QString &Astrkay);
    inline QStringHash GetDataContent()const {return m_Hush;}
    inline QString getText()const{return m_strText;}

signals:
    void textChanged(const QString &AstrKay);

public slots:
    void setText(const QString &AstrKay);

private:
    bool LoadFromBin (const  QString &Astrfpath);
    bool LoadFromText(const  QString &Astrfpath);
    void SaveToBin   (const  QString &Astrfpath);

private:
       QStringHash  m_Hush;
       QString      m_strText;

};

#endif // JYIME_PINYIN_H
