class Walker {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass = random(1,10);
  float scale;
  float scaleMultiplier = 10;
  //PVector spawnValue = new PVector(-500,200);
  PVector colors = new PVector(int(random(256)),int(random(256)),int(random(256)));

  Walker(float wMass) {
    
    mass = wMass;
    scale = wMass * scaleMultiplier;
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    
  }


  void applyForce(PVector force) {
    PVector appliedForce = PVector.div(force, mass); 
    acceleration.add(appliedForce);
  }
  
 void render() {
  //PVector colors = new PVector(int(random(256)),int(random(256)),int(random(256))); turn on for fun 
    fill(colors.x, colors.y, colors.z);
    circle(position.x, position.y, scale);
  }
  
  
  void moveAndBounce() { // C/P & edited from bluerayball code
  
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); 

    
    if ((position.x > Window.right) || (position.x < Window.left)) {
      velocity.x *= -1;
    }
    if (( position.y > Window.top) || ( position.y < Window.bottom)) {
      velocity.y *= -1;
    }
  }

 
}
