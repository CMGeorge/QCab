QT += core
QT -= gui

CONFIG += c++11

TARGET = MSPack
#CONFIG += console
CONFIG -= app_bundle

TEMPLATE = lib
#CONFIG += c++14
HEADERS += \
    mspack/cab.h \
    mspack/chm.h \
    mspack/crc32.h \
    mspack/des.h \
    mspack/hlp.h \
    mspack/kwaj.h \
    mspack/lit.h \
    mspack/lzss.h \
    mspack/lzx.h \
    mspack/mspack.h \
    mspack/mszip.h \
    mspack/oab.h \
    mspack/qtm.h \
    mspack/readbits.h \
    mspack/readhuff.h \
    mspack/sha.h \
    mspack/system.h \
    mspack/szdd.h

SOURCES += \
    mspack/cabc.c \
    mspack/cabd.c \
    mspack/chmc.c \
    mspack/chmd.c \
    mspack/crc32.c \
    mspack/hlpc.c \
    mspack/hlpd.c \
    mspack/kwajc.c \
    mspack/kwajd.c \
    mspack/litc.c \
    mspack/litd.c \
    mspack/lzssd.c \
    mspack/lzxc.c \
    mspack/lzxd.c \
    mspack/mszipc.c \
    mspack/mszipd.c \
    mspack/oabc.c \
    mspack/oabd.c \
    mspack/qtmc.c \
    mspack/qtmd.c \
    mspack/system.c \
    mspack/szddc.c \
    mspack/szddd.c

mac{
    DEFINES += HAVE_CONFIG_H
    INCLUDEPATH += "osx"
    HEADERS += $$PWD/osx/config.h
}

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
