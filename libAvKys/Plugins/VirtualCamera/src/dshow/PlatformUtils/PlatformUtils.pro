# Webcamoid, webcam capture application.
# Copyright (C) 2018  Gonzalo Exequiel Pedone
#
# Webcamoid is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Webcamoid is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
#
# Web-Site: http://webcamoid.github.io/

exists(akcommons.pri) {
    include(akcommons.pri)
} else {
    exists(../../../../../akcommons.pri) {
        include(../../../../../akcommons.pri)
    } else {
        error("akcommons.pri file not found.")
    }
}

include(../dshow.pri)

CONFIG += \
    staticlib \
    create_prl \
    no_install_prl
CONFIG -= qt

DESTDIR = $${OUT_PWD}/$${BIN_DIR}

TARGET = PlatformUtils

TEMPLATE = lib

LIBS = \
    -L$${OUT_PWD}/../../VCamUtils/$${BIN_DIR} -lVCamUtils \
    -ladvapi32 \
    -lkernel32 \
    -lgdi32 \
    -lshell32

SOURCES = \
    src/messageserver.cpp \
    src/mutex.cpp \
    src/utils.cpp \
    src/sharedmemory.cpp

HEADERS =  \
    src/messagecommons.h \
    src/messageserver.h \
    src/mutex.h \
    src/utils.h \
    src/sharedmemory.h

INCLUDEPATH += \
    ../..
