
public class Walker 
{
    public PVector position;
    public PVector velocity;
    public PVector acceleration;
    public float scale;
    public color col;
    public float velocityLimiter;
    public PVector mouse;
    
    PVector mousePos(){
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

  //changed it to a constructor
  Walker(float pX, float pY)
  {
    position = new PVector(pX, pY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    scale = random(1, 150);
    col = color(random(255), random(255), random(255)); 
    velocityLimiter = 10;
    mouse = new PVector();
  }
  
  
  public void update()
  {
      mouse = mousePos();
      PVector direction = PVector.sub(mouse, position);
     //this.acceleration = PVector.random2D();
     this.acceleration.set(-0.01, 0.1);
     direction.normalize().mult(500);
     this.acceleration.add(direction);
     this.acceleration.mult(0.2);
     this.velocity.add(acceleration);
     this.velocity.limit(velocityLimiter);
     this.position.add(this.velocity); 
  }
  
  public void render()
  {
    fill(col);
    circle(position.x, position.y, scale);
  }
  
  public void checkBorders()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
     
    } else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
      
    } else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
  
  
  
  
  
  
  
  
}
