/* Webcamoid, webcam capture application.
 * Copyright (C) 2011-2014  Gonzalo Exequiel Pedone
 *
 * Webcamod is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamod is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamod. If not, see <http://www.gnu.org/licenses/>.
 *
 * Email     : hipersayan DOT x AT gmail DOT com
 * Web-Site 1: http://github.com/hipersayanX/Webcamoid
 * Web-Site 2: http://opendesktop.org/content/show.php/Webcamoid?content=144796
 */

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

ColumnLayout {
    id: recEffectConfig

    property string curEffect: ""
    property bool inUse: false

    signal effectAdded(string effectId)

    onCurEffectChanged: {
        Webcamoid.removeEffectControls("itmEffectControls")
        Webcamoid.embedEffectControls("itmEffectControls", curEffect)
    }

    Label {
        id: lblEffect
        text: qsTr("Plugin id")
        font.bold: true
        Layout.fillWidth: true
    }
    TextField {
        id: txtEffect
        text: recEffectConfig.curEffect
        placeholderText: qsTr("Plugin id")
        readOnly: true
        Layout.fillWidth: true
    }
    Label {
        id: lblDescription
        text: qsTr("Description")
        font.bold: true
        Layout.fillWidth: true
    }
    TextField {
        id: txtDescription
        text: Webcamoid.effectDescription(recEffectConfig.curEffect)
        placeholderText: qsTr("Plugin description")
        readOnly: true
        Layout.fillWidth: true
    }
    RowLayout {
        id: rowControls
        Layout.fillWidth: true

        Label {
            Layout.fillWidth: true
        }

        Button {
            id: btnAddRemove
            iconName: inUse? "remove": "add"
            text: inUse? qsTr("Remove"): qsTr("Add")
            enabled: recEffectConfig.curEffect == ""? false: true

            onClicked: {
                if (inUse) {
                    Webcamoid.removeEffect(recEffectConfig.curEffect)

                    if (Webcamoid.currentEffects.length < 1)
                        recEffectConfig.curEffect = ""
                }
                else {
                    Webcamoid.setAsPreview(recEffectConfig.curEffect, false)
                    recEffectConfig.effectAdded(recEffectConfig.curEffect)
                }
            }
        }
    }
    RowLayout {
        id: itmEffectControls
        objectName: "itmEffectControls"
        Layout.fillWidth: true
    }
    Label {
        Layout.fillHeight: true
    }
}