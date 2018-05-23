class Ball extends RigidBody {
    Ball(color shapeColour, PVector position, int mass) {
        super(shapeColour, position, mass);
    }
    void display() {
        fill(colour);
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateX(PI/180*orientation.x);
        rotateY(PI/180*orientation.y);
        rotateZ(PI/180*orientation.z);
        sphereDetail(10);

        sphere(10);
        popMatrix();
    }
    void friction() {
        velocity.mult(0.98);
        angularVelocity.mult(0.98);
    }
}
