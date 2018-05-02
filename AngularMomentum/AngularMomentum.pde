//http://www.bzarg.com/p/3d-rotational-dynamics-1-the-basics/
//http://ai.stanford.edu/~varung/rigidbody.pdf
//https://en.wikipedia.org/wiki/Euler%27s_equations_(rigid_body_dynamics)
//RigidBody cube;
//RigidBody cube2;
RigidBody cylinder;
float a = 1;
void setup() {
    size(800, 600, P3D);
    //cube = new Cube(color(255, 255, 255), new PVector(400, 300, -400), 500);
    //cube2 = new Cube(color(255, 1, 255), new PVector(0, 100, 0), 80);
    //cube2.velocity.x = 4;
    cylinder = new Cylinder(color(255, 1, 255), new PVector(0, 100, 0), 0, 60, 50/a, 50/a);
    cylinder.orientation.y = 90;
    cylinder.velocity.y = 1;
    cylinder.netforce.y = -0.01;
    //cube2.velocity.z = 9;
    //cube2.velocity.y = 9;
    camera(40, 20, -80.0, 40, 40, -80, 0.0, 0.0, 1.0);
}

float GRAVITATIONAL_CONSTANT = 1;
float d;
float m;
void draw() {
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
    cylinder.display();
    cylinder.move();
    
    cylinder.angularVelocity.x = cylinder.velocity.y;

    //cube.display();
    //cube2.move();
    //cube2.display();
}
