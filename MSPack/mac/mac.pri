mac{
    CONFIG += debug_and_release
    CONFIG += build_all
    include(osx.pri)
    include(ios.pri)

}

DISTFILES += \
    $$PWD/osx.pri \
    $$PWD/ios.pri
