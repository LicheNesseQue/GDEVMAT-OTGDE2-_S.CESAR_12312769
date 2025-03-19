  int startTime;
void setup()  
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
  startTime = millis();
}

void draw() 
{ 
  if (millis() - startTime > 3000) { 
    background(0);
    startTime = millis();
}
  //if (frameCount % 10 == 0) {  background(0);}
    
  int randomValue1 = int(random(720));
  float gaussian1 = randomGaussian();
  
    int r = int(random(256));   
    int g = int(random(256));  
    int b = int(random(256));   
 
  float standardDeviation = 150;
  float alphaDeviation = 15;
  float xMean = 0;
  float yMean = 350;
  float alphaMean = 10;
  
  float y = randomValue1 - yMean;
  float x = standardDeviation * gaussian1 + xMean;
  float alpha = alphaDeviation * gaussian1 + alphaMean;
  
  
  
  noStroke();
  fill(r, g, b);
  
  
  circle(x, y, alpha);
  
}
