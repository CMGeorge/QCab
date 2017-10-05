QT += core
QT -= gui

CONFIG += c++11

#TARGET = MSPack
LIB_NAME = MSPack
TARGET = $$qt5LibraryTarget($$LIB_NAME)

TEMPLATE = lib
CONFIG  *= qt warn_on
CONFIG  *= relative_qt_rpath

!android{
#    CONFIG *= debug_and_release
#    CONFIG *= build_all
    CONFIG += lib_bundle
}else{
    CONFIG -= debug
    CONFIG *=release
}

PREFIX=$$[QT_INSTALL_PREFIX]
include(MSPack.pri)
target.path = $$PREFIX
unix:!mac {
    headers.path=$$PREFIX/include/quazip
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target

        OBJECTS_DIR=.obj
        MOC_DIR=.moc

}else:include(mac/mac.pri)

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

DISTFILES += \
    mac/mac.pri
