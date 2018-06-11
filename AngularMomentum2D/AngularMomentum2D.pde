PVector[] positions = {};
PVector[] vectors = {};

void setup(){
    size(900, 450, P3D);
    setupBalls();
    println(new PVector(0, 0.1).heading());
}

void draw(){
    lights();
    drawTable();
    checkCollisions();
    updateBalls();
    drawBalls();
    updateShootAngle();
    drawVectors();
}

void drawVectors(){
    for(int i = 0; i < positions.length; i++){
        strokeWeight(1);
        line(positions[i].x, positions[i].y, positions[i].x + vectors[i].x, positions[i].y + vectors[i].y);
        strokeWeight(5);
        point(positions[i].x + vectors[i].x, positions[i].y + vectors[i].y);
    }
}

void addVector(PVector pos, float x, float y){
    positions = (PVector[]) append(positions, pos);
    vectors = (PVector[]) append(vectors, new PVector(x, y));
}

void addVector(float posX, float posY, PVector vec){
    positions = (PVector[]) append(positions, new PVector(posX, posY));
    vectors = (PVector[]) append(vectors, vec);
}

void addVector(PVector pos, PVector vec){
    positions = (PVector[]) append(positions, pos);
    vectors = (PVector[]) append(vectors, vec);
}

void drawTable(){
    strokeWeight(1);
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
