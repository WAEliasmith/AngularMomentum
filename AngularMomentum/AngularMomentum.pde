//http://www.bzarg.com/p/3d-rotational-dynamics-1-the-basics/
//http://ai.stanford.edu/~varung/rigidbody.pdf
//https://en.wikipedia.org/wiki/Euler%27s_equations_(rigid_body_dynamics)
RigidBody cube;
RigidBody cube2;
RigidBody cylinder;
float a = 1;
ArrayList<Ball> balls;


void setup() {
    noCursor();
    //noStroke();
    balls = new ArrayList();
    size(800, 600, P3D);
    //cube = new Cube(color(255, 255, 255), new PVector(400, 300, -400), 500);
    //cube2 = new Cube(color(255, 1, 255), new PVector(0, 100, 0), 80);
    //cube2.velocity.x = 4;
    cylinder = new Cylinder(color(255, 1, 255), new PVector(0, 100, 0), 0, 60, 50/a, 50/a);
    cylinder.orientation.y = 90;
    cylinder.velocity.y = 1;
    cylinder.netforce.y = -0.01;
    //cube = new Cube(color(255, 255, 255), new PVector(400, 300, -400), 500);
    //cube2 = new Cube(color(255, 1, 255), new PVector(0, 100, 0), 80);
    //cube2.orientation.x = 45;
    //cube2.angularVelocity.y = 4;
    //cube2.angularVelocity.x = 4;
    //cylinder.orientation.y = 90;
    //cylinder.velocity.y = 15;
    //cylinder.netforce.y = -0.1;
    //cylinder.angularVelocity.x = 1.5;
    //cylinder.angularAcceleration.x = -0.01;
    //cube2.velocity.z = 9;
    //cube2.velocity.y = 9;
}

void mouseDragged() {
    //PVector rotationalVector = new PVector(mouseX-pmouseX, mouseY-pmouseY);
    cylinder.velocity.y = mouseY - pmouseY;
    //cylinder.velocity.z = mouseX - pmouseX;
    //cylinder.orientation.y += mouseY - pmouseY;
}

float GRAVITATIONAL_CONSTANT = 1;
float d;
float m;
void draw() {
    camera(40, 20, -90.0, 40, 40, -90, 0.0, 0.0, 1.0);
    lights();
    background(0);
    //d = dist(cube.position.x, cube.position.y, cube.position.z, cube2.position.x, cube2.position.y, cube2.position.z);
    //m = (cube.mass * cube2.mass);
    //cube2.netforceMagnitude = GRAVITATIONAL_CONSTANT * m/sq(d);
    //float xDiff = cube.position.x - cube2.position.x;
    //float yDiff = cube.position.y - cube2.position.y;
    //float zDiff = cube.position.z - cube2.position.z;
    //cube2.netforce = new PVector(xDiff, yDiff, zDiff).normalize().mult(GRAVITATIONAL_CONSTANT * m/sq(d));

    if (space) {
        space = false;
        cylinder.velocity.y += 0.5;
        //cylinder.angularVelocity.x += 0.5*a;
    }
    if (r) {
        w-=1;
        //cylinder.angularVelocity.x += 0.5*a;
    }
    if (f) {
        w+=1;
    }
    cylinder.display();
    cylinder.update();

    cylinder.angularVelocity.x = cylinder.velocity.y;

    //cube.display();
    //cube2.move();
    //cube2.display();
    //cylinder.display()
    //cube.display();
    //cube.update();
    //cube2.display();
    //cube2.update();
    pushMatrix();
    fill(255, 0, 0);
    //translate((mouseX*0.8-width*0.35), 400, (mouseY*0.8-height*0.5));
    translate((mouseX-width/2), w, (mouseY-height/2));
    box(10);
    popMatrix();
    cylinder.netforce.y = -0.01;
    for (int i = balls.size()-1; i >= 0; i--) {
        Ball entity = balls.get(i);

        entity.display();
        entity.update();
        entity.friction();
        for (int j = balls.size()-1; j >= 0; j--) {
            if (j != i) {
                Ball entity2 = balls.get(j);
                if (collision(entity.position, entity2.position, 20)) {
                    //PVector collisionAngle = entity.position.copy().sub(entity2.position);
                    //float angle1 = PVector.angleBetween(entity.velocity, collisionAngle);
                    //float angle2 = PVector.angleBetween(entity2.velocity, collisionAngle);
                    //angle1 = PI-angle1;
                    PVector temp = entity.velocity.copy();
                    entity.velocity = entity2.velocity.copy();
                    entity2.velocity = temp.copy();
                    temp = entity.angularVelocity.copy();
                    entity.angularVelocity = entity2.angularVelocity.copy();
                    entity2.angularVelocity = temp.copy();
                }
            }
        }
    }
}

boolean collision(PVector p1, PVector p2, float r) {
    if (p1.dist(p2)<r) {
        return true;
    }
    return false;
}
