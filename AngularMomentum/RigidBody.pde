abstract class RigidBody {
    PVector position;
    PVector velocity; // Velocity
    PVector netforce;
    PVector angularVelocity;
    PVector angularAcceleration;
    PVector orientation;
    int mass;
    float netforceMagnitude;

    color colour;

    RigidBody(color shapeColour, PVector position, int mass) {
        colour = shapeColour;
        
        angularAcceleration = new PVector(0, 0, 0);
        orientation = new PVector(0, 0, 0);
        angularVelocity = new PVector(0, 0, 0);
        
        this.position = position;
        velocity = new PVector(0, 0, 0);
        netforce = new PVector(0, 0, 0);
        this.mass = mass;
    }

    void move() {
        angularVelocity.x += angularAcceleration.x;
        angularVelocity.y += angularAcceleration.y;
        angularVelocity.z += angularAcceleration.z;
        
        orientation.x += angularVelocity.x;
        orientation.y += angularVelocity.y;
        orientation.z += angularVelocity.z;

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
