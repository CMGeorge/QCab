#!/bin/sh
cd "$(dirname "$0")" ;
echo "=============Preparing QCab================="
make clean
qmake -spec macx-ios-clang CONFIG+=iphoneos CONFIG+=device
make qmake_all
echo "Making QuaZip Library"
make -j 8 --silent -w  > /dev/null
echo "Installing QCab"
make install
