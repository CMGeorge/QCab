#include <QtCore/QCoreApplication>
#include <stdio.h>
#include "mspack.h"
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QStandardPaths>
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    a.setApplicationName("Test Cab");
    a.setOrganizationDomain("ro.wesell");
    a.setOrganizationName("CMG Development");
    struct mscab_decompressor *cabd;
    struct mscabd_cabinet *cab;
    struct mscabd_file *file;
    int test;

    MSPACK_SYS_SELFTEST(test);
    if (test != MSPACK_ERR_OK) exit(0);
    QFile _source(":/SimpleDemo.CTX");
    if (!_source.exists()){
        qDebug()<<"Archive does not exists";
        exit(1);
    }
    QDir _tempDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    if (_tempDir.exists()){
//        if (!_tempDir.removeRecursively()){
//            qDebug()<<"Can't clean temp directory";
//        }
    }
    QString _tempDirectory = _tempDir.path();
    qDebug()<<"Crate temo dir "<<_tempDir.mkpath(_tempDirectory);
    QString _tempFileName("SimpleDemo.CTX");
    //    _tempFile.remove();
    QFile _tempFilePath(_tempDirectory+"/"+_tempFileName);
    QFile::setPermissions(_tempFilePath.fileName(),QFileDevice::ReadOwner|QFileDevice::WriteOwner);
    qDebug()<<"Temp file: "<<_tempDirectory<<" using "<<_tempFilePath.fileName();

    qDebug()<<"Copying file... "<<_source.copy(_tempFilePath.fileName());//<<" = "<<_file.errorString();
//    _source.flush();
    _tempDir.mkpath(_tempDir.path());
    if (!_tempDir.exists()){
        qDebug()<<"Temp dir is not valid";
    }
    if (!_tempFilePath.open((QIODevice::ReadOnly))){
        qDebug()<<"File can't be oppened";
    }
    _tempFilePath.close();
    if ((cabd = mspack_create_cab_decompressor(NULL))) {
        /*!
         * \brief ba https://wiki.qt.io/Technical_FAQ#How_can_I_convert_a_QString_to_char.2A_and_vice_versa.3F
         */
        QByteArray ba = _tempFilePath.fileName().toLatin1();
        const char *_charFileName = ba.data();
        if ((cab = cabd->open(cabd,_charFileName))) {
            //            _tempDir.
            for (file = cab->files; file; file = file->next) {
                //                qDebug()<<file->filename;
                QString _extractedFileName = QString(_tempDirectory)+"/"+QString(file->filename);
                QFile _newFile(_extractedFileName);
                if (_newFile.exists()){
                    _newFile.remove();
                }
                if (cabd->extract(cabd,file,_charFileName)!=MSPACK_ERR_OK){

                }

            }
            cabd->close(cabd, cab);
        }else{
            qDebug()<<"Archive not found";
        }
        mspack_destroy_cab_decompressor(cabd);
    }else{
        qDebug()<<"No Compressor Found";
    }
    qDebug()<<"App done";
    return a.exec();
}
