RigidBody cube;
RigidBody cube2;
void setup(){
    size(800,600,P3D);
    cube = new Cube(color(255,255,255),new PVector(400, 300, -400));
    cube2 = new Cube(color(255,1,255),new PVector(0, 100, 0));
}
int t = 0;
int r = 0;
void draw(){
    clear();
    if (t == 0){cube2.velocity.x = 4;}
    t += 1;
    r = int(sqrt(sq(cube2.position.x-cube.position.x)+sq(cube2.position.y-cube.position.y)+sq(cube2.position.z-cube.position.z)));
    cube2.netforce.x = -int((10000*10000)/sq(r))/(cube.position.y-cube2.position.y)/(cube.position.z-cube2.position.z);
    cube2.netforce.y = -int((10000*10000)/sq(r))/(cube.position.x-cube2.position.x)/(cube.position.z-cube2.position.z);
    cube2.netforce.z = -int((10000*10000)/sq(r))/(cube.position.y-cube2.position.y)/(cube.position.x-cube2.position.x);

    
    cube.display();
    cube2.move();
    cube2.display();
}
