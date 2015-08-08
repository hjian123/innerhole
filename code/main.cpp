#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include"serial.h"
#include"datprocess.h"
#include "comboxcust.h"
#include <QQmlContext>
#include "keyboard/JyIME_PinYin.h"
QQmlContext  *g_Context;
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Serial>("an.qt.Serial", 1, 0, "Serial");
    qmlRegisterType<Datprocess>("an.qt.Serial", 1, 0, "Datprocess");
   // qmlRegisterType<Comboxcust>("an.qt.Comboxcust", 1, 0, "Comboxcust");
    qmlRegisterType<JyIME_PinYin>("Pinyin",1,0,"JyIME_PinYin");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/innerhole.qml")));

    return app.exec();
}
