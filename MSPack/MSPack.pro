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

}else:mac{
    CONFIG+= debug_and_release
    DESTDIR = $$[QT_INSTALL_LIBS]
    QMAKE_FRAMEWORK_BUNDLE_NAME = $$LIB_NAME
    export(QMAKE_FRAMEWORK_BUNDLE_NAME)
    FRAMEWORK_HEADERS.files = $$HEADERS
    FRAMEWORK_HEADERS.path = Headers
    QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS

    LIB_VERSION_PATH=$${LIB_NAME}.framework/Versions/1/$$TARGET
    QMAKE_POST_LINK += install_name_tool -id @rpath/$$LIB_VERSION_PATH $$[QT_INSTALL_LIBS]/$$LIB_VERSION_PATH $$escape_expand(\\n\\t)
#    INSTALLS+=target
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
