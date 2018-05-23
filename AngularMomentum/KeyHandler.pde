boolean space;
boolean r;
boolean f;
float w = 400;
void keyPressed() {
    String whichKey = "default";
    if (key == CODED) {
        whichKey = str(keyCode);
    } else {
        whichKey = str(key);
    }
    if (whichKey.equals(" ")) {
        space = true;
    }
    if (whichKey.equals("w")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);
        newBall.netforce.z = -5;
        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;


        balls.add(newBall);
    }
    if (whichKey.equals("s")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);        
        balls.add(newBall);
        newBall.netforce.z = 5;

        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;
    }
    if (whichKey.equals("a")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);
        newBall.netforce.x = -5;
        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;
        newBall.angularAcceleration.x = 3*newBall.netforce.y;        
        balls.add(newBall);
    }
    if (whichKey.equals("d")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);
        newBall.netforce.x = 5;
        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;
        newBall.angularAcceleration.x = 3*newBall.netforce.y;        
        balls.add(newBall);
    }
    if (whichKey.equals("q")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);
        newBall.netforce.y = 5;
        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;
        newBall.angularAcceleration.x = 3*newBall.netforce.y;        
        balls.add(newBall);
    }
    if (whichKey.equals("e")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(mouseX-width/2, w, mouseY-height/2), 10);
        newBall.netforce.y = -5;
        newBall.angularAcceleration.z = 3*newBall.netforce.x;
        newBall.angularAcceleration.x = -3*newBall.netforce.z;
        newBall.angularAcceleration.x = 3*newBall.netforce.y;
        balls.add(newBall);
    }
    if (whichKey.equals("r")) {r = true;}
    if (whichKey.equals("f")) {f = true;}
}

void keyReleased() {
    String whichKey = "default";
    if (key == CODED) {
        whichKey = str(keyCode);
    } else {
        whichKey = str(key);
    }

    if (whichKey.equals("r")) {
        r = false;
    }
    if (whichKey.equals("f")) {
        f = false;
    }
}
