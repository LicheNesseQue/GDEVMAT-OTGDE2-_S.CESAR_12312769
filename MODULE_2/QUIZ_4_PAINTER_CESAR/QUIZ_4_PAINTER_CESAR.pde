void setup()  
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

float t = 0;
Walker perlinWalker = new Walker();

void draw()
{
  
  
  
  perlinWalker.perlinWalk();
  perlinWalker.render();
  /*
  float n = noise(t);
  float x = map(n,0,1,0,360);
  rect(-640 + (t * 100), -360, 1, x);
  
  t += 0.01f;
  float random = noise(t);
  println(random);
  t += 0.0001f;
  */  
}
