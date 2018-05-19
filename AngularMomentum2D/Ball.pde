Ball[] balls = new Ball[15];

final float BALL_SIZE = 15;

class Ball {
    PVector position;
    PVector acceleration;
    PVector velocity;
    float orientation;
    float rotation;
    color colour;

    Ball(float xPos, float yPos) {
        position = new PVector(xPos, yPos);
        orientation = 0;
        colour = color(random(255), random(255), random(255));
        rotation = -random(1);
    }
    
    void update(){
        orientation += rotation;
        rotation *= 0.98;
        
    }

    void display() {
        pushMatrix();
        translate(position.x, position.y);
        rotate(orientation);
        fill(colour);
        noStroke();
        ellipse(0, 0, BALL_SIZE, BALL_SIZE);
        stroke(0);
        line(0, 0, 0, -BALL_SIZE/2);
        popMatrix();
    }
}

void setupBalls() {
    int index = 0;
    for (int i = 4; i > -1; i--) {
        for (int j = 0; j < i + 1; j++) {
            balls[index] = new Ball(width/2 + j * BALL_SIZE, i * BALL_SIZE);
            index++;
        }
    }
}

void drawBalls() {
    for (int i = 0; i < balls.length; i++) {
        balls[i].display();
    }
}

void updateBalls() {
    for (int i = 0; i < balls.length; i++) {
        balls[i].update();
    }
}
