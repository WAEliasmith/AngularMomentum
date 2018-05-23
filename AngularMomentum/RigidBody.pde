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

    void update() {
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
        this.netforce = new PVector();
        this.angularAcceleration = new PVector();
    }

    void display() {
        fill(colour);
        pushMatrix();
        translate(position.x, position.y, position.z);
        //rotateXYZ(radians(orientation.x), radians(orientation.y), radians(orientation.z));
        rotateX(PI/180*orientation.x);
        rotateY(PI/180*orientation.y);
        rotateZ(PI/180*orientation.z);
        println(orientation);
        box(100);
        popMatrix();
    }
}
void rotateXYZ(float xx, float yy, float zz) {
    //float cx, cy, cz, sx, sy, sz;

    //cx = cos(xx);
    //cy = cos(yy);
    //cz = cos(zz);
    //sx = sin(xx);
    //sy = sin(yy);
    //sz = sin(zz);

    //applyMatrix(cy*cz, (cz*sx*sy)-(cx*sz), (cx*cz*sy)+(sx*sz), 0.0, 
    //    cy*sz, (cx*cz)+(sx*sy*sz), (-cz*sx)+(cx*sy*sz), 0.0, 
    //    -sy, cy*sx, cx*cy, 0.0, 
    //    0.0, 0.0, 0.0, 1.0);
    //rotateX();
}
