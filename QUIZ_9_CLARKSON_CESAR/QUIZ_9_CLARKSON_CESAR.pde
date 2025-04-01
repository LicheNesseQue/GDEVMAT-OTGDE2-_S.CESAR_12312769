int numWalkers = 8;
Walker[] myWalkers = new Walker[numWalkers];
int positionX;
int positionY;

void setup() {
  
  size(1280, 720, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  for (int i = 0; i < myWalkers.length; i++) {
    
    positionY =  2 * (Window.windowHeight / numWalkers)  * (i - (numWalkers / 2));
    myWalkers[i] = new Walker(i + 1);
    myWalkers[i].position = new PVector(-500, positionY);   
    
  }
}

void draw() {
  background(0);
 //background(random(0,100)); Eyekiller

  for (Walker walkersLoop : myWalkers) {
    PVector standardSpeed = new PVector(0.2, 0);
    
    float mewOne = 0.1f;
    float mewTwo = 0.4f;
    float normalForce = 1;
    float frictionMagnitude = mewOne * normalForce;
    
   if (walkersLoop.position.x > 640) {
     
      mewOne = mewTwo;
      PVector friction = walkersLoop.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      walkersLoop.applyForce(friction);
      
   } else {
     
      PVector friction = walkersLoop.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      walkersLoop.applyForce(friction);  
   }
    
    walkersLoop.applyForce(standardSpeed);
    
    walkersLoop.moveAndBounce();
    walkersLoop.render();
 
  }
  
  
}
void mousePressed() {
  
  for (Walker walker : myWalkers) {
    walker.position.x = -500; 
    walker.velocity.set(0, 0); 
  }
  
}
