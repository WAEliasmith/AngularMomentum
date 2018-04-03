abstract class RigidBody {
    PVector position;
    PVector velocity; // Velocity
    PVector netforce;
    PVector spin;
    PVector orientation;
    int mass;
    float netforceMagnitude;

    color colour;

    RigidBody(color shapeColour, PVector position, int mass) {
        colour = shapeColour;
        this.position = position;
        orientation = new PVector(0, 0, 0);
        spin = new PVector(0, 0, 0);
        velocity = new PVector(0, 0, 0);
        netforce = new PVector(0, 0, 0);
        this.mass = mass;
    }

    void move() {
        orientation.x += spin.x;
        orientation.y += spin.y;
        orientation.z += spin.z;

        velocity.x += netforce.x;
        velocity.y += netforce.y;
        velocity.z += netforce.z;

        position.x += velocity.x;
        position.y += velocity.y;
        position.z += velocity.z;
    }
    
    
    void display() {
        fill(colour);
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateX(PI/180*orientation.x);
        rotateY(PI/180*orientation.y);
        rotateZ(PI/180*orientation.z);
        box(100);
        popMatrix();
    }
}
