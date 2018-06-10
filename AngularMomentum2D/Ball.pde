Ball[] balls = new Ball[16];
Ball whiteBall;

final float BALL_SIZE = 25;

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
    float heading = 0;

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
        position.add(velocity);
        velocity.mult(0.98);
        orientation += rotation;
        rotation *= 0.98;
        updateHeading();
    }
    
    void updateHeading(){
        if(velocity.mag()!= 0){
            heading = velocity.heading();
        }
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
        strokeWeight(1);
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
    
    final float DAMPENING = 0.85;
    void fixToBounds(){
        if(position.x <= 5 + BALL_SIZE){
            position.x = 5 + BALL_SIZE;
            velocity.x = abs(velocity.x);
            velocity.mult(DAMPENING);
        }
        if(position.x >= width - 5 - BALL_SIZE){
            position.x = width - 5 - BALL_SIZE;
            velocity.x = -abs(velocity.x);
            velocity.mult(DAMPENING);
        }
        if(position.y <= 5 + BALL_SIZE){
            position.y = 5 + BALL_SIZE;
            velocity.y = abs(velocity.y);
            velocity.mult(DAMPENING);
        }
        if(position.y >= height - 5 - BALL_SIZE){
            position.y = height - 5 - BALL_SIZE;
            velocity.y = -abs(velocity.y);
            velocity.mult(DAMPENING);
        }
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
    balls[balls.length - 1] = whiteBall;
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
        for (int j = i+1; j < balls.length; j++) {
            if (collide(balls[i], balls[j])) {
                PVector dist = balls[i].position.copy().sub(balls[j].position); //Vector ji
                balls[i].position.add(dist.copy().normalize().mult((BALL_SIZE - dist.mag())/2 + 0.01));
                balls[j].position.add(dist.copy().normalize().mult(-(BALL_SIZE - dist.mag())/2 + 0.01));
                float angleI = PVector.angleBetween(balls[i].velocity, dist);//cos
                float angleJ = PI - PVector.angleBetween(balls[j].velocity, dist);
                PVector ballJParr = dist.copy().normalize().mult(balls[i].velocity.mag() * cos(angleI));
                PVector ballIPerp = balls[i].velocity.copy().sub(ballJParr);
                PVector ballIParr = dist.copy().normalize().mult(-balls[j].velocity.mag() * cos(angleJ));
                PVector ballJPerp = balls[j].velocity.copy().sub(ballIParr);
                balls[i].rotation = (dist.heading() - balls[j].heading) / abs(dist.heading() - balls[j].heading) * (ballJPerp.mag() - ballIPerp.mag())/10;//1 - random(2);
                balls[j].rotation = (dist.heading() - balls[i].heading) / abs(dist.heading() - balls[i].heading) * (ballIPerp.mag() - ballJPerp.mag())/10;
                float initialMagSum = balls[i].velocity.mag() + balls[j].velocity.mag();
                balls[i].velocity = ballIParr.add(ballIPerp);
                balls[j].velocity = ballJParr.add(ballJPerp);
                float afterMagSum = balls[i].velocity.mag() + balls[j].velocity.mag();
                balls[i].velocity.mult(0.98 * initialMagSum/afterMagSum);
                balls[j].velocity.mult(0.98 * initialMagSum/afterMagSum);
                PVector pos = balls[j].position.copy().add(dist.copy().mult(0.5));
                addVector(pos, balls[i].velocity.copy().mult(10));
                addVector(pos, balls[j].velocity.copy().mult(10));
            }
        }
        balls[i].fixToBounds();
    }
}

boolean collide(Ball ball1, Ball ball2) {
    if (pow(ball1.position.x - ball2.position.x, 2) + pow(ball1.position.y - ball2.position.y, 2) < pow(BALL_SIZE, 2)) {
        return true;
    }
    return false;
}
