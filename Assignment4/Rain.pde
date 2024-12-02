class Rain {
  PVector position; //position for raindrops
  PVector velocity; //velocity for raindrops
  PVector acceleration; //acceleration for raindrops to imitate gravity like effect
  
  Rain(){ //constructor
  //start from the top of the window
  position = new PVector (random(100,300),40);//start from top
  velocity = new PVector (0,random(2,5)); //initial velocity
  acceleration = new PVector (0,0.1);//constant downward acceleration
  }
  
  //update the position of the rain
  void update(){
    
    //sex maximum rain velocity
    if (velocity.y > 11){
      velocity.y = 11;
    }
    
    position.add(velocity);//apply velocity to position
    velocity.add(acceleration);//apply acceleration to velocity
    
  //reset if it goes out the window (non visible) to create an endless loop
  if (position.y > 350){
    position.y = 40;//reset to top of window
    position.x = random(100,300);//randomize rain generation while still inside window range
  }
}

//display the rain
void display(){
  stroke(255);//white rain
  line(position.x,position.y,position.x,position.y + 10); //draw the rain drop
}
}
