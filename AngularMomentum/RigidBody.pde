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
    }
    
    
    
}
