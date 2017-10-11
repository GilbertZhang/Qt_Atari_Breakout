import QtQuick 2.0
import Box2D 2.0   //We refer to Body.Dynamic which is defined in Box2D
import "../shared"  //CircleBody is defined in the shared folder

Rectangle {
    id: agentBall

    property color agentColor: "yellow"

    width: 80
    height: 10
    //radius: 20
    color: agentColor
    border.color: "white"
    smooth: true

    property Body body: paddleboxBody

    BoxBody{
        id: paddleboxBody

        target: agentBall
        world:physicsWorld

        width: agentBall.width
        height:agentBall.height

        sleepingAllowed: false
        bodyType: Body.Kinematic

        density: 10
        friction: 1
        restitution: 1
    }

    property int leftBoundary : 0
    property int rightBoundary : 640

    function move(distance){
        // If distance is negative, move left until we the left boundary.
        // If distance is positive, move right until we reach the right boundary.
        console.log(agentBall.x);
        if (((distance < 0) && (agentBall.x > leftBoundary))
                ||  ((distance > 0) && (agentBall.x < (rightBoundary - width)))){
            x = x + distance
        }
    }

    Behavior on x {
        NumberAnimation { duration: 10 }
    }

}
