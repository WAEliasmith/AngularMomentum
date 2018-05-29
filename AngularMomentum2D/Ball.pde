Ball[] balls = new Ball[16];
Ball whiteBall;

final float BALL_SIZE = 50;

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
        acceleration = new PVector(0, 0, 0);
        velocity = new PVector(0, 0, 0);
        orientation = 0;
        colour = color(random(255), random(255), random(255));
        rotation = -random(1);
    }

    void update() {
        velocity.add(acceleration);
        velocity.mult(0.98);
        position.add(velocity);
        orientation += rotation;
        rotation *= 0.98;
    }

    void display() {
        pushMatrix();
        translate(position.x, position.y);
        rotateZ(orientation);
        fill(colour);
        noStroke();
        sphere(BALL_SIZE/2);
        //ellipse(0, 0, BALL_SIZE, BALL_SIZE);
        translate(0, 0, BALL_SIZE/2);
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
            balls[index] = new Ball(width/4 + i * (BALL_SIZE + 0.01) * sqrt(3) / 2, height/2 + (j + i/2.0 - 2) * (BALL_SIZE + 0.01));
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

void checkCollisions() {
    for (int i = 0; i < balls.length; i++) {
        for (int j = 0; j < balls.length; j++) {
            if(i != j && collide(balls[i], balls[j])){
                PVector dist = balls[i].position.copy().sub(balls[j].position);
                float angleI = PVector.angleBetween(balls[i].velocity, dist) - PI/2;
                float angleJ = PI - PVector.angleBetween(balls[j].velocity, dist);
                PVector ballJParr = dist.copy().normalize().mult(balls[j].velocity.mag() * sin(angleI));
                PVector ballIPerp = balls[i].velocity.copy().sub(ballJParr);
                PVector ballIParr = dist.copy().normalize().mult(balls[j].velocity.mag() * sin(angleJ));
                PVector ballJPerp = balls[j].velocity.copy().sub(ballIParr);
                balls[i].velocity = ballIParr.add(ballIPerp).mult(0.6);
                balls[j].velocity = ballJParr.add(ballJPerp).mult(0.6);
            }
        }
    }
}

boolean collide(Ball ball1, Ball ball2){
    if(pow(ball1.position.x - ball2.position.x, 2) + pow(ball1.position.y - ball2.position.y, 2) < pow(BALL_SIZE, 2)){
        return true;
    }
    return false;
}
