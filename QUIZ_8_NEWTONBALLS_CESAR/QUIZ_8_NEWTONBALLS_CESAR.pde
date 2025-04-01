Walker[] myWalkers = new Walker[10];

void setup() {
  size(1280, 720, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  for (int i = 0; i < myWalkers.length; i++) {
    myWalkers[i] = new Walker(i + 1);
  }
}

void draw() {
  background(0);
 //background(random(0,100)); Eyekiller
 
 
  PVector gravity = new PVector(0, -0.4);
  PVector wind = new PVector(0.15, 0);

  for (Walker walkersLoop : myWalkers) {
    walkersLoop.applyForce(wind);
    walkersLoop.applyForce(gravity);
    walkersLoop.moveAndBounce();
    walkersLoop.render();
  }
}
