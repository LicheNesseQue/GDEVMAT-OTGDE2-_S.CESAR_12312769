class Walker {
  float x;
  float y; 
  
  float x2;
  float y2;
  
  
   
  int startTime;
  
  void setup() {
    startTime = millis(); 
}

  
  void render() 
  {
    int r = int(random(256));   
    int g = int(random(256));  
    int b = int(random(256));   
    int a = int(random(50, 101)); 
  
    /* OG code
    int rng = int(random(255));
    color randomColor = color(random(255), random(255), random(255));
    fill(randomColor);
    noStroke();
    */
    
     fill(r, g, b, a);
    circle(x - 500,y,30);
   
  }
  void render2()
  {
    int r = int(random(256));   
    int g = int(random(256));  
    int b = int(random(256));   
    int a = int(random(50, 101)); 
  
     fill(r, g, b, a);
    circle(x2 + 200,y2,30);
  }
  
   void randomWalk()
  {
     if (millis() - startTime > 3000) { // Stop after 300 seconds (300000 ms)
        return;
    }
    int rng = int(random(8));
    
    switch (rng)
    {
      case 0:
        y+=9;
        break;
      case 1:
        y-=7;
        break;
     case 2: 
        x+=10;
        break;
     case 3:
        x-=8;
        break;
     case 4:
         x+=8;
         y+=9;
         break;
     case 5:
         x-=2;
         y+=9;
         break;
     case 6:
         x+=8;
         y-=5;
         break;
     case 7: 
         x-=8;
         y-=5;
         break;
    }
  }
  
  void randomWalkBiased()
    {
       
      if (millis() - startTime > 3000) { // Stop after 300 seconds (300000 ms)
        return;
    }
       int rng = int(random(10)); 
    
    switch (rng) { //fall through
        case 0:
        case 1:
        case 2:
        case 3: 
            x2 += 10;
            break;
        case 4:
        case 5: 
            x2 -= 8;
            break;
        case 6:
        case 7: 
            y2 -= 10;
            break;
        case 8:
        case 9: 
            y2 += 9;
            break;
    }
  
  }

  
  
}
