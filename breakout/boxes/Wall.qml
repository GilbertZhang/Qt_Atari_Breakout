import QtQuick 2.0
import "../shared"  // BoxBody is defined in the shared folder
import Box2D 2.0

Item {
    id: wall

//    BoxBody {
//        target: wall
//        world: physicsWorld  //physicsWorld is not declared as a property so it must be defined by the containing object

//        width: wall.width
//        height: wall.height
//        restitution: 1
//    }

    ImageBoxBody {
        x:wall.x
        y:wall.y
        source: "wall.jpg"
        fillMode: Image.Tile

        world: physicsWorld

        friction: 1
        density: 1
        width: wall.width
        height: wall.height
        restitution: 1
    }
}


