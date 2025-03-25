public class Walker{
//  PVector position = new PVector();
 // public float scale = 15;
 PVector pos = new PVector();


void render(){
  int randomValue1 = int(random(720));
  float gaussian1 = randomGaussian();
  
   
  float standardDeviation = 150;
  float alphaDeviation = 15;
  float xMean = 0;
  float yMean = 350;
  float alphaMean = 10;
   
   float y = randomValue1 - yMean;
  float x = standardDeviation * gaussian1 + xMean;
  float alpha = alphaDeviation * gaussian1 + alphaMean;
  
  noStroke();
 
  circle(x, y, alpha);
}
  void newRender()
  {
    circle(pos.x, pos.y, 30);
  }


}
