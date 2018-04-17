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
