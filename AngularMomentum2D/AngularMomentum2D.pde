void setup(){
    size(900, 450, P3D);
    setupBalls();
}

void draw(){
    lights();
    drawTable();
    checkCollisions();
    updateBalls();
    drawBalls();
    //balls[15].velocity.x -= 0.1;
    updateShootAngle();
}

void drawTable(){
    pushMatrix();
    fill(61, 24, 0);
    translate(0, 0, -5);
    rect(-5, -5, width + 10, height + 10);
    translate(0, 0, 1);
    fill(88, 171, 63);
    rect(20, 20, width - 40, height - 40);
    stroke(255);
    line(20, height/2, 0, width - 20, height/2, 0);
    popMatrix();
}
