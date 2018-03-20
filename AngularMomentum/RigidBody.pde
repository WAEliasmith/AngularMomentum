abstract class RigidBody{
    PVector position;
    PVector velocity;
    PVector spin;
    PVector orientation;
    
    color colour;
    
    RigidBody(color shapeColour, PVector position){
        colour = shapeColour;
        this.position = position;
        orientation = new PVector(0, 0, 0);
    }
    
    void display(){
        fill(colour);
        pushMatrix();
        translate(position.x,position.y,position.z);
        rotateX(PI/4);
        rotateY(PI/4);
        box(100);
        popMatrix();
    }
    
    
    
}
