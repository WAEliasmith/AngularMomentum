Ball[] balls = new Ball[16];
Ball whiteBall;

final float BALL_SIZE = 15;

int index = 0;

class Ball {
    PVector position;
    PVector acceleration;
    PVector velocity;
    float orientation;
    float rotation;
    color colour;
    boolean noNumber;
    int number;

    Ball(float xPos, float yPos) {
        index ++;
        number = index;
        position = new PVector(xPos, yPos);
        orientation = 0;
        colour = color(random(255), random(255), random(255));
        rotation = -random(1);
    }

    void update() {
        orientation += rotation;
        rotation *= 0.98;
    }

    void display() {
        pushMatrix();
        translate(position.x, position.y);
        rotate(orientation);
        fill(colour);
        noStroke();
        sphere(BALL_SIZE/2);
        //ellipse(0, 0, BALL_SIZE, BALL_SIZE);
        if (noNumber) {
            stroke(0);
            line(0, 0, 0, -BALL_SIZE/2);
        } else {
            textAlign(CENTER);
            fill(0);
            text(number, 0, BALL_SIZE/4);
        }
        popMatrix();
    }
}

void setupBalls() {
    int index = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5 - i; j++) {
            balls[index] = new Ball(width/4 + i * BALL_SIZE * sqrt(3) / 2, height/2 + (j + i/2.0 - 2) * BALL_SIZE);
            index++;
        }
    }
    whiteBall = new Ball(3 * width / 4, height/2);
    whiteBall.noNumber = true;
    whiteBall.colour = color(255);
    balls[15] = whiteBall;
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
