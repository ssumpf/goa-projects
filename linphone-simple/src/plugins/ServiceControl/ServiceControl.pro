TEMPLATE = lib

CONFIG += qt plugin qmltypes
QT     += qml quick quick-private

QML_IMPORT_NAME = ServiceControl
QML_IMPORT_MAJOR_VERSION = 1

DESTDIR = install/qt/qml/ServiceControl
TARGET  = servicecontrolplugin

plugin_files.path  = $${OUT_PWD}/install/qt/qml/ServiceControl
plugin_files.files = qmldir

SOURCES += plugin.cpp servicecontrol.cpp
HEADERS += servicecontrol.h

INSTALLS += plugin_files
