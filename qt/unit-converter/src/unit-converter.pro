TEMPLATE = aux

qml_files.path = $${OUT_PWD}/install

TARGET = unit-converter

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

OTHER_FILES += $${QML_FILES}

#specify where the qml/js files are installed to
qml_files.files += $${QML_FILES}

INSTALLS+=qml_files
