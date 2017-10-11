import QtQuick 2.0
import Box2D 2.0   //We refer to Body.Dynamic which is defined in Box2D
import "../shared"  //CircleBody is defined in the shared folder

Rectangle {
    id: agentBall

    property color agentColor: "yellow"

    width: 40
    height: 20
    //radius: 20
    color: agentColor
    border.color: "white"
    smooth: true

    property Body body: boxBody
    property alias agentText: agentText.text
    property int  nextWaypoint

//    CircleBody {
//        id: circleBody

//        target: agentBall
//        world: physicsWorld

//        bullet: true
//        bodyType: Body.Dynamic

//        radius: agentBall.radius
//        density: 0.9
//        friction: 0.9
//        restitution: 0.2
//    }

    BoxBody{
        id: boxBody

        target: agentBall
        world:physicsWorld

        bullet: true

//        bodyType: Body.Dynamic
        width: agentBall.width
        height:agentBall.height
        density: 0.9
        friction: 0.9
        restitution: 1
    }

    Text{
        id:agentText
        x:15
        y:10
    }


}


