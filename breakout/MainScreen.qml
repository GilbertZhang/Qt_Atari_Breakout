import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.0

import Box2D 2.0  //There should be a directory called Box2D in the qml directory of your Qt installation.

import "boxes" as QtBoxes //boxes is a subdirectory of this project; we rename it as "QtBoxes"
import "./shared"

Rectangle{
            id: worldContainer
            anchors.fill: parent

            property bool started: false
            focus: true


            Keys.onSpacePressed: {
                if (!started){
                    console.log("start")
                    ball.body.linearVelocity.x += Math.random()*10;
                    ball.body.linearVelocity.y = 10;
                    started = true
                }
            }

            Keys.onLeftPressed: paddle.move(-30)
            Keys.onRightPressed: paddle.move(30)
            Keys.onEscapePressed: Qt.quit();

            ListModel{

                id: agents

                ListElement { initialX: 60
                              initialY: 60}
                ListElement { initialX: 100
                              initialY: 60}
                ListElement { initialX: 140
                              initialY: 60}
                ListElement { initialX: 180
                              initialY: 60}
                ListElement { initialX: 220
                              initialY: 60}
                ListElement { initialX: 260
                              initialY: 60}
                ListElement { initialX: 300
                              initialY: 60}
                ListElement { initialX: 340
                              initialY: 60}
                ListElement { initialX: 380
                              initialY: 60}
                ListElement { initialX: 420
                              initialY: 60}
                ListElement { initialX: 460
                              initialY: 60}

                ListElement { initialX: 60
                              initialY: 80}
                ListElement { initialX: 100
                              initialY: 80}
                ListElement { initialX: 140
                              initialY: 80}
                ListElement { initialX: 180
                              initialY: 80}
                ListElement { initialX: 220
                              initialY: 80}
                ListElement { initialX: 260
                              initialY: 80}
                ListElement { initialX: 300
                              initialY: 80}
                ListElement { initialX: 340
                              initialY: 80}
                ListElement { initialX: 380
                              initialY: 80}
                ListElement { initialX: 420
                              initialY: 80}
                ListElement { initialX: 460
                              initialY: 80}

                ListElement { initialX: 60
                              initialY: 100}
                ListElement { initialX: 100
                              initialY: 100}
                ListElement { initialX: 140
                              initialY: 100}
                ListElement { initialX: 180
                              initialY: 100}
                ListElement { initialX: 220
                              initialY: 100}
                ListElement { initialX: 260
                              initialY: 100}
                ListElement { initialX: 300
                              initialY: 100}
                ListElement { initialX: 340
                              initialY: 100}
                ListElement { initialX: 380
                              initialY: 100}
                ListElement { initialX: 420
                              initialY: 100}
                ListElement { initialX: 460
                              initialY: 100}

                ListElement { initialX: 60
                              initialY: 120}
                ListElement { initialX: 100
                              initialY: 120}
                ListElement { initialX: 140
                              initialY: 120}
                ListElement { initialX: 180
                              initialY: 120}
                ListElement { initialX: 220
                              initialY: 120}
                ListElement { initialX: 260
                              initialY: 120}
                ListElement { initialX: 300
                              initialY: 120}
                ListElement { initialX: 340
                              initialY: 120}
                ListElement { initialX: 380
                              initialY: 120}
                ListElement { initialX: 420
                              initialY: 120}
                ListElement { initialX: 460
                              initialY: 120}


            }


            World {
                id: physicsWorld

                onStepped: {
//                        paddle.y = 400
//                        paddle.x = mouse.mouseX;
                    }

            }

            QtBoxes.Bricks {
                    id: balls
                    physicsWorld: physicsWorld
                    agentList: agents
            }

            QtBoxes.Paddle {
                id:paddle
                x: 300
                y: 400
                agentColor:{
                    var color_idx = Math.floor(5 * Math.random());
                    var colors = ["pink", "grey", "lightblue", "lightgreen", "yellow"];
                    return colors[color_idx]
                }
            }

            QtBoxes.Ball{
                id: ball
                x:300
                y:390
            }

//            MouseArea {
//                id:mouse
//                anchors.fill: parent
//                onClicked: {
//                    ball.body.linearVelocity.x = 3;
//                    ball.body.linearVelocity.y = 50;
//                    console.log(mouseX)
//                }


//            }


            Rectangle {
                id: debugButton
                x: 500
                y: 450
                width: 120
                height: 30
                Text {
                    text: debugDraw.visible ? "Debug view: on" : "Debug view: off"
                    anchors.centerIn: parent
                }
                color: "#DEDEDE"
                border.color: "#999"
                radius: 5
                MouseArea {
                    anchors.fill: parent
                    onClicked: debugDraw.visible = !debugDraw.visible;
                }

            }

            DebugDraw {
                id: debugDraw
                world: physicsWorld
                opacity: 0.75
                visible: false
            }

}

