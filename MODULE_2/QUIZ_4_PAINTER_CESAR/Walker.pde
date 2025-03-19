public class Walker
{
public float x;
public float y;
public float tx = 0, ty = 10000, tCircle = 100, tRed = 10, tGreen = 1, tBlue = 100;
public float circleScale;
public float r, g, b;  
public float colorMap1, colorMap2, colorMap3;
void render()
{   
 
  
  
  /*
  r = map(noise(tRed), 0, 1, -640, 640); 
  g = map(noise(tGreen), 0, 1, -640, 640);    
  b = map(noise(tBlue), 0, 1, -640, 640);   
 */
  
  
fill(colorMap1, colorMap2, colorMap3);
noStroke();
circle(x,y,circleScale);
}
void perlinWalk()
{
 colorMap1 = map(noise(tRed), 0, 1, 0, 255); 
 colorMap2 = map(noise(tGreen), 0, 1, 0, 255); 
 colorMap3 = map(noise(tBlue), 0, 1, 0, 255);
 
 x = map(noise(tx), 0, 1, -640, 640);
 y = map(noise(ty), 0, 1, -320, 320);
 circleScale = map(noise(tCircle), 0, 1, 5, 150);
 
 tx += 0.01f;
 ty += 0.01f;
 tCircle +=0.01f;
 tRed += 0.1f;
 tGreen +=0.1f;
 tBlue +=0.1f;
}

}
