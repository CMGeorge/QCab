QT += core
QT -= gui

CONFIG += c++11

TARGET = MSPack
#CONFIG += console
CONFIG -= app_bundle

TEMPLATE = lib
CONFIG  *= qt warn_on
CONFIG  *= relative_qt_rpath
CONFIG  *= debug_and_release
CONFIG  *=build_all

PREFIX=$$[QT_INSTALL_PREFIX]
include(MSPack.pri)

unix:!symbian {
    headers.path=$$PREFIX/include/MSPack
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target

        OBJECTS_DIR=.obj
        MOC_DIR=.moc

}

win32 {
    headers.path=$$PREFIX/include/MSPack
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target
    # workaround for qdatetime.h macro bug
    DEFINES += NOMINMAX
}
CONFIG *= install_ok  # Do not cargo-cult this!
CONFIG *= install
