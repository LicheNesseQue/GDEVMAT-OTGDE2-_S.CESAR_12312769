int numParticles = 100;
Walker myWalker[];

void setup() {
    
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
    myWalker = new Walker[numParticles];


    for (int i = 0; i < numParticles; i++) 
    {
        myWalker[i] = new Walker(random(-640, 640), random(-360, 360));
    }
}


void draw() {
    background(0);

    for (int i = 0; i < myWalker.length; i++)
    { 
      
        myWalker[i].update();
        myWalker[i].render();
        myWalker[i].checkBorders();
        
    }
}
