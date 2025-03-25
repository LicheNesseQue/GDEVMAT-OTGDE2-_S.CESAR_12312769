int numParticles = 100;
float blackHoleRadius = 25;
PVector blackHole; 
int startTime;
int windowWidthHalf = 640;
int windowheightHalf = 450;

Particle[]  arrayParticles = new Particle[numParticles];
void setup()
{
   size(1280, 900, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   startTime = millis();
  WhiteHoleSimulation();
 
}
void draw(){
  background(0);
  fill(255);
  circle(blackHole.x, blackHole.y, blackHoleRadius * 2); 
  fill(50);
  circle(blackHole.x, blackHole.y, blackHoleRadius);
  for(int i = 0; i < arrayParticles.length; i++)
  { 
    arrayParticles[i].Update();  
  }
  for(Particle particlesLoop: arrayParticles)
  {
    particlesLoop.Render();
  }
  

   
    
  if (millis() - startTime > 3000){
    WhiteHoleSimulation();
    startTime = millis();
  }
   
}


void WhiteHoleSimulation(){
     blackHole = new PVector(random(-640,640), random(-450,450));
      for(int i = 0; i < arrayParticles.length; i++)
      { 
          arrayParticles[i] = new Particle();
          arrayParticles[i].position = new PVector(random(-windowWidthHalf,windowWidthHalf), random(-windowheightHalf,windowheightHalf));
          arrayParticles[i].scale = random(5,30);
          arrayParticles[i].col = color(random(255), random(255), random(255));  
      }
      
}

      
