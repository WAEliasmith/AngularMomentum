RigidBody cube;
RigidBody cube2;
void setup(){
    size(800,600,P3D);
    cube = new Cube(color(255,255,255),new PVector(200, 100, 0));
    cube2 = new Cube(color(255,1,255),new PVector(200, 100, 100));
}

void draw(){
    cube.display();
    cube2.display();
}
