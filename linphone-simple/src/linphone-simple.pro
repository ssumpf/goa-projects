TEMPLATE = subdirs

qml_files.path = $${OUT_PWD}/install/linphone-simple

TARGET = linphone-simple

QML_FILES += qml assets ringtones

OTHER_FILES += $${QML_FILES}

qml_files.files += $${QML_FILES}

SUBDIRS = plugins/Linphone \
          plugins/ServiceControl

INSTALLS+=qml_files
