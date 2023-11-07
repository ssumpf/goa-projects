TEMPLATE = lib

CONFIG += qt plugin qmltypes
QT     += qml quick quick-private

QML_IMPORT_NAME = Linphone
QML_IMPORT_MAJOR_VERSION = 1

DESTDIR = install/qt/qml/Linphone
TARGET  = linphoneplugin

plugin_files.path  = $${OUT_PWD}/install/qt/qml/Linphone
plugin_files.files = qmldir

SOURCES += plugin.cpp linphone.cpp
HEADERS += linphone.h

INSTALLS += plugin_files
