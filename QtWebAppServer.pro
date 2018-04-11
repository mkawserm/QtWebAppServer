#-------------------------------------------------
#
# Project created by QtCreator 2018-04-10T04:25:55
#
#-------------------------------------------------

TARGET = QtWebAppServer
TEMPLATE = lib
CONFIG += c++11
QT -= gui
QT += core

!win32:VERSION = 1.0.0

include(httpserver.pri)

#CONFIG(debug, debug|release) {
#     mac: TARGET = $$join(TARGET,,,_debug)
#     win32: TARGET = $$join(TARGET,,,d)
#}

TEMPNAME = $${QMAKE_QMAKE}
QTPATH = $$dirname(TEMPNAME)

#OBJECTS_DIR=.obj
#MOC_DIR=.moc
DEFINES+=DECLSPEC=Q_DECL_EXPORT

#message($$[QT_HOST_LIBS])
unix{
    CONFIG += lib_bundle
    #headers.path=$$QTPATH/../include/QSsh
    #headers.files=$$KARCHIVE_PUBLIC_HEADERS
    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
    INSTALLS += target

    FRAMEWORK_HEADERS.version = Versions
    FRAMEWORK_HEADERS.files = $$HEADERS
    FRAMEWORK_HEADERS.path = Headers
    QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS

    target.path=$$QTPATH/../lib/$${LIB_ARCH}
}


win32 {
    headers.path=$$[QT_INSTALL_HEADERS]/QSsh
    headers.files=$$QSSH_PUBLIC_HEADERS
    CONFIG(staticlib){
        target.path=$$PREFIX/lib
        QMAKE_PKGCONFIG_LIBDIR = $$PREFIX/lib/
    } else {
        target.path=$$PREFIX/bin
        QMAKE_PKGCONFIG_LIBDIR = $$PREFIX/bin/
    }
    INSTALLS += headers target
    ## odd, this path seems to be relative to the
    ## target.path, so if we install the .dll into
    ## the 'bin' dir, the .pc will go there as well,
    ## unless have hack the needed path...
    ## TODO any nicer solution?
    #QMAKE_PKGCONFIG_DESTDIR = ../lib/pkgconfig
    # workaround for qdatetime.h macro bug
}


android{
    headers.path=$$[QT_INSTALL_HEADERS]/QtWebAppServer
    headers.files=$$HEADERS
    #target.path=$$[QT_HOST_LIBS]
    INSTALLS += headers
}
