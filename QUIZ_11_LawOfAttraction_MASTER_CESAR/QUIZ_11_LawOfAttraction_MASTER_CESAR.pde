int numWalkers = 10;
Walker[] bigWalkers = new Walker[numWalkers];
Walker[] smallWalkers = new Walker[numWalkers];

void setup() {
 
  size(1600, 900, P3D);
  camera(0 , 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
    for( int i = 0; i < smallWalkers.length; i++)
    {
      
      smallWalkers[i] = new Walker();
      smallWalkers[i].position = new PVector(random(-800,800), random(-450,450));
      smallWalkers[i].mass = 10 - i;
      smallWalkers[i].scale = smallWalkers[i].mass * 10;
      
    }
   
   for( int i = 0; i < bigWalkers.length; i++)
   { 
   
      bigWalkers[i] = new Walker();
      bigWalkers[i].position = new PVector(random(-800,800), random(-450,450));
      bigWalkers[i].mass = 20 - i;
      bigWalkers[i].scale = bigWalkers[i].mass * 15;
      
  }
}

void draw() {
 background(150); 
 //background(random(0,50)); // a lil bit of eyestrain is all I need, a lil bit of eyedrops on my eyes, a lil bit of eyewear is all I want, a lil bit of headaches is all I get
   
   //render loops
    for(Walker w : bigWalkers)
    {
      w.render();
      w.Update();    
    }
      
    for(Walker w : smallWalkers)
    {
      w.render();
      w.Update(); 
    }
   
    //attraction loops for same groups
 for (int i = 0; i < bigWalkers.length; i++) 
  {
    for (int j = i + 1; j < bigWalkers.length; j++) 
    {
        bigWalkers[j].applyForce(bigWalkers[i].platonicAttractionCalculation(bigWalkers[j]));
    }
  }

 for (int i = 0; i < smallWalkers.length; i++) 
  {
  
    for (int j = i + 1; j < smallWalkers.length; j++) 
    {
        smallWalkers[j].applyForce(smallWalkers[i].platonicAttractionCalculation(smallWalkers[j]));
    }
    
  }

 
 
 //attraction loop for across groups
 for (Walker big : bigWalkers) 
 {
   
    for (Walker small : smallWalkers)
    {
        small.applyForce(big.platonicAttractionCalculation(small));
    }
    
 }
 
 for (Walker small : smallWalkers) 
 {
    for (Walker big : bigWalkers)
    {
        big.applyForce(small.platonicAttractionCalculation(big));
    }
    
 }
}
