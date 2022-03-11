/*
 * Copyright (c) 2023, Johan Thelin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the editors nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import QtQuick
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Lights")

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            clearColor: "#222222"
            backgroundMode: SceneEnvironment.Color
        }

        Model {
            position: Qt.vector3d(0, -50, 0)
            scale: Qt.vector3d(4.0, 4.0, 4.0)
            eulerRotation.x: -90
            source: "#Rectangle"
            materials: [ DefaultMaterial { diffuseColor: "red"; } ]
        }

        Model {
            position: Qt.vector3d(0, 0, 0)
            source: "#Sphere"
            materials: [ DefaultMaterial { diffuseColor: "green"; } ]
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 200, 500)
            Component.onCompleted: lookAt(Qt.vector3d(0, 0, 0))
        }

        SpotLight {
            position: Qt.vector3d(50, 200, 50)
            eulerRotation.x: -90

            brightness: 5
            ambientColor: Qt.rgba(0.1, 0.1, 0.1, 1.0)

            castsShadow: true
        }

        PointLight {
            position: Qt.vector3d(100, 100, 150)

            castsShadow: true
        }

        DirectionalLight {
            eulerRotation.x: 210
            eulerRotation.y: 20

            castsShadow: true
        }
    }
}
