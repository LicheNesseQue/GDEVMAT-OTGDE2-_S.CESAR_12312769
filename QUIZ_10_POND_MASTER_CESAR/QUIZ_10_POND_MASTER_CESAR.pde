Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
int numWalkers = 10;
Walker[] myWalkers = new Walker[numWalkers];
int positionX;
int positionY;
float scaleMultiplier = 10;
void setup() {
 
  size(1600, 900, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  for( int i = 0; i < myWalkers.length; i++) {
  positionX = 2 * (Window.windowWidth / (numWalkers + 1)) * (i - 5);
  myWalkers[i] = new Walker();
  myWalkers[i].position = new PVector(positionX, 500);
  myWalkers[i].mass = 10 - i;
  myWalkers[i].scale = myWalkers[i].mass * 15;
  }
}

void draw() {
 //background(150); HEHEHEHEHEHEHHEHEHEHEHEHEHEHEHEEHEHEHEHHEEHEHEHEHHEEHEHEHEHHEHEHEHEHEEHHEHEHEHEHEHEHEEH
 background(random(0,50)); // a lil bit of eyestrain is all I need, a lil bit of eyedrops on my eyes, a lil bit of eyewear is all I want, a lil bit of headaches is all I get
  ocean.render();
  
  for(Walker w : myWalkers){
  w.render();
  w.Update();
  PVector gravity = new PVector(0, -0.15 * w.mass);
  PVector wind = new PVector( 0.1f, 0);
  w.applyForce(gravity);
  
  if(!w.inWater) { w.applyForce(wind); }
   
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  PVector friction = w.velocity.copy();
  
  w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
  
  if(w.position.y <= Window.bottom)
  {
     w.position.y = Window.bottom;
     w.velocity.y *= -1;
  }
  
  if(ocean.isCollidingWithLiquid(w))
  {  
    w.inWater = true;
    PVector dragForce = ocean.calculateDragForce(w);
    w.applyForce(dragForce);
  
  } else { w.inWater = false; } // so it defaults to false if obj is not in water
  
  w.moveAndBounce();
  
  }
  
}
