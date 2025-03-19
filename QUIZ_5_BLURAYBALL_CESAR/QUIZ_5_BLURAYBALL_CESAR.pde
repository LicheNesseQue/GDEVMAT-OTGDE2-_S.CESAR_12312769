void setup(){
  size(1280, 900, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);



}
Walker DVDPlayer = new Walker();

void draw(){
  
  background(255);

  DVDPlayer.moveAndBounce();
  DVDPlayer.render();
  
  
  
}
