void setup()  
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
 
}

Walker myWalker = new Walker();

void draw()
{
 //background(50);
  
   
   myWalker.randomWalk();
   myWalker.render();
  
   myWalker.randomWalkBiased();
   myWalker.render2();
}
