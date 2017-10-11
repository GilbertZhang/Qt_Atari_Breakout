import QtQuick 2.0
import Box2D 2.0   //We refer to Body.Dynamic which is defined in Box2D
import "../shared"  //CircleBody is defined in the shared folder

Rectangle {
    id: agentBall

    property color agentColor: "grey"

    width: 20
    height: 20
    radius: 10
    color: agentColor
    border.color: "white"
    smooth: true

    property Body body: circleBody

    CircleBody {
        id: circleBody

        target: agentBall
        world: physicsWorld

        bullet: true
        bodyType: Body.Dynamic

        radius: agentBall.radius
        density: 0.9
        friction: 0.9
        restitution: 1
        gravityScale: 0
        fixture.onBeginContact: {
          // for access of the collided entity and the entityType and entityId:
          var body = other.getBody();
          var collidedEntity = body.target;
          var collidedEntityType = collidedEntity.entityType;
          var collidedEntityId = collidedEntity.entityId;

          if (agentBall.y < 200 && agentBall.y > 30 && agentBall.x > 40 && agentBall.x < 590){ body.target.destroy();}
          if (agentBall.y > 200 && agentBall.x > 40 && agentBall.x < 590 && ball.body.linearVelocity.y != 0){
              ball.body.linearVelocity.x = Math.random()*10;
              ball.body.linearVelocity.y = -10;
          }
        }
    }
}
