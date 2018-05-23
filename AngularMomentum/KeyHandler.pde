boolean space;
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
    if (whichKey.equals("e")) {
        Ball newBall = new Ball(color(255, 255, 255), new PVector(0, 400, 0), 10);
        newBall.netforce.x = 5;
        newBall.angularAcceleration.z = 10;
        balls.add(newBall);
    }
}

//void keyReleased() {
//    String whichKey = "default";
//    if (key == CODED) {
//        whichKey = str(keyCode);
//    } else {
//        whichKey = str(key);
//    }

//    if (whichKey.equals(" ")) {
//        space = false;
//    }
//}
