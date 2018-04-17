class Cylinder extends RigidBody {
    int sides;
    float r;
    float h;
    
    Cylinder(color shapeColour, PVector position, int mass, int sides, float r, float h) {
        super(shapeColour, position, mass);
        this.sides = sides;
        this.r = r;
        this.h = h;
    }
    
    
    
    void display()
    {
        fill(colour);
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateX(PI/180*orientation.x);
        rotateY(PI/180*orientation.y);
        rotateZ(PI/180*orientation.z);
        
        
        float angle = 360 / sides;
        float halfHeight = h / 2;
        // draw top shape
        beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos( radians( i * angle ) ) * r;
            float y = sin( radians( i * angle ) ) * r;
            vertex( x, y, -halfHeight );
        }
        endShape(CLOSE);
        // draw bottom shape
        beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos( radians( i * angle ) ) * r;
            float y = sin( radians( i * angle ) ) * r;
            vertex( x, y, halfHeight );
        }
        endShape(CLOSE);
        // draw body
        beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < sides + 1; i++) {
            float x = cos( radians( i * angle ) ) * r;
            float y = sin( radians( i * angle ) ) * r;
            vertex( x, y, halfHeight);
            vertex( x, y, -halfHeight);
        }
        endShape(CLOSE);
        popMatrix();
    }
}
