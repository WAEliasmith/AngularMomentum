void setup(){
    size(900, 450);
    setupBalls();
}

void draw(){
    drawTable();
    updateBalls();
    drawBalls();
}

void drawTable(){
    fill(61, 24, 0);
    rect(0, 0, width, height);
    fill(88, 171, 63);
    rect(20, 20, width - 40, height - 40);
}
