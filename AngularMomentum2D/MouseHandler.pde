void mousePressed() {
    println("breaching mainframe");
}

float shootAngle = 0;
PVector shootVector = new PVector(0, 0);
void updateShootAngle() {
    shootAngle = atan2(mouseY - whiteBall.position.y, mouseX - whiteBall.position.x);
    shootVector = PVector.fromAngle(shootAngle);
    println(shootAngle);
    whiteBall.position.add(shootVector);
}
