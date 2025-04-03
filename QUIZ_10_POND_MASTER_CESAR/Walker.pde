public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public boolean inWater = false;
  public float velocityLimiter = 10;
  public float scale = 15;
  
  public float mass = 1;
  
  PVector colors = new PVector(int(random(255)),int(random(255)),int(random(255)));
  
  public Walker(){
      
    
  }
  
   void applyForce(PVector force) {
    PVector appliedForce = PVector.div(force, this.mass); 
    acceleration.add(appliedForce);
  }
  
  void Update()
  {
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimiter);
     this.position.add(this.velocity);
     this.acceleration.mult(0);
      
    
  }
  
  public void render()
  {
    fill(colors.x, colors.y, colors.z);
    circle(position.x, position.y, scale); 
  }
  
   void moveAndBounce() { // C/P & edited from bluerayball code
  
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); 

    
    if ((position.x > Window.right) || (position.x < Window.left)) {
      velocity.x *= -1;
    }
   
  }
}
