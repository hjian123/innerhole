TEMPLATE = app

QT += qml quick widgets  serialport

SOURCES += main.cpp \
    serial.cpp \
    datprocess.cpp \
    keyboard/JyIME_PinYin.cpp \
    qextserial/qextserialport.cpp \
    comboboxcust.cpp

win32 {
     SOURCES += qextserial/qextserialport_win.cpp
}

unix {
     SOURCES += qextserial/qextserialport_unix.cpp
}

RESOURCES += \
    qml.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ComboBox.qml \
    Semiauto.qml \
    Semiauto.qml \
    keyboard/Keybutton.qml \
    keyboard/LineView.qml \
    keyboard/TextEditor.qml \
    keyboard/VirtualKeyboard.qml \
    keyboard/Mask.qml \
    Popup.qml \
    ScrollBar.qml \
    TestFlickableScrollBar.qml \
    FlickableScrollBar.qml \
    Mychat.qml \
    Monitor_contactor.qml \
    Monitor_org.qml \
    Monitor_rundata.qml \
    Monitor_sys1.qml

HEADERS += \
    serial.h \
    datprocess.h \
    global.h \
    keyboard/JyIME_PinYin.h \
    qextserial/qextserialport.h \
    qextserial/qextserialport_global.h \
    qextserial/qextserialport_p.h \
    comboxcust.h
