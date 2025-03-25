Walker[] arrayWalker = new Walker[10];

void setup(){
  size(1080, 720, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  //for(int i = 0; i < arrayWalker.length; i++)
  //{
    //arrayWalker[i] = new Walker();
    //arrayWalker[i].pos = new PVector(random(-540,540), random(-360,360));
  //}
}


PVector mousePos(){
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

void draw(){
  //Walker myWalker = new Walker();
  
  //println(mousePos().x + " " + mousePos().y); 
  background(255);
 
  PVector mouse = mousePos();
  mouse.normalize().mult(500);
  
  strokeWeight(20);
  stroke(255, 0, 0,100);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  strokeWeight(15);
  stroke(255, 0, 0);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  /*for( int i = 0; i <10; i++)
  {
  myWalker.render();
  }*/
  //for(Walker circleEach: arrayWalker)
  //{
    //circleEach.newRender();
  //}
  
  float angle = atan2(mouse.y, mouse.x);
  strokeWeight(20);
  stroke(0, 0, 0);
  rotate(angle);
  line(-50, 0, 50 , 0);
  
  
  
  
  println(mouse.mag()); 
}
