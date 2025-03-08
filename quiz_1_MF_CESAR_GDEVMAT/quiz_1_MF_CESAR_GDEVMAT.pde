void setup()

{ 
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}



void draw()

{
 background(50);
 
 /*
 these are old code 
 //circle(0, 0, 30);
 //strokeWeight(4);
 //color white = color (255, 255, 255);
 //fill(white);
 //stroke(white);
 //line(-75, -75, 75, 75);
  */
 
cartesianPlaneGenerator();
drawQuadFunction();
drawLinearFunction();
sineWaveBaby();
}

void cartesianPlaneGenerator()
{
strokeWeight(1);
 
 color white = color (255, 255, 255);
 fill(white);
 stroke(white);
 
 line(300, 0, -300, 0);
 line(0, -300, 0, -300);
  
 for(int i = -300; i <= 300; i += 10)
 {
 
 line(i, -3, i, 3);
 
 line(-3, i, 3, i);
 }
}

void drawLinearFunction()
{
  /*
     f(x) = -5x + 30
  */
  color yellow = color (255,255,0);
  fill(yellow);
  noStroke();
  
  for (float x = - 300; x<= 300; x+=0.1f)
  {
  circle (x * 10, ((-5 *x) + 30), 3);
  }
}

void drawQuadFunction ()
{
   color teal = color (0,255,255);
  fill(teal);
  noStroke();
  
  for (float x = - 300; x<= 300; x+=0.1f)
  {
  circle(x * 10, ((float)Math.pow(x, 2) - (15 * x) - 3), 3);
  }
}


float angle = 0.0;
float angleSmoothness = 0.1;
float amplitude = 100;
float frequency = 0.2;
float waveSpeed = 1;


void sineWaveBaby()
{
  color color2 = color (255,255,255);
  fill(color2);
  noStroke();
  
  float tempAngle = angle;
  float currentWaveSpeed = waveSpeed;
  
  for (float x = 0; x < width; x +=10) {
    float y = sin(tempAngle) * amplitude;
    circle(x, y, 10);
    tempAngle += angleSmoothness;
  }
  angle -= currentWaveSpeed * frequency;
  
  if (keyCode == RIGHT){
    currentWaveSpeed += 0.5;
    waveSpeed = currentWaveSpeed;
  } else if (keyCode == LEFT){ 
  currentWaveSpeed -= 0.5;
   waveSpeed = currentWaveSpeed;
  }
}
