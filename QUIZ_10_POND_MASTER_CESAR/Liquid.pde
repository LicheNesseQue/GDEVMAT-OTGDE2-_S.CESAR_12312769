public class Liquid
{
   public float x, y;
   public float horizon, depth;
   public float cd;  
   
    public Liquid(float mX, float mY, float mHorizon, float mDepth, float mCD)
    {
      this.x = mX;
      this.y = mY;
      this.horizon = mHorizon;
      this.depth = mDepth;
      this.cd = mCD;
    }
    
    public void render()
    {
      noStroke();
      fill( 28, 120, 186);
      beginShape();
      vertex(x - horizon, y, 0);
      vertex(x + horizon, y, 0);
      vertex(x + horizon, y + depth, 0);
      vertex(x - horizon, y + depth, 0);
      endShape();   
    }
    
    public boolean isCollidingWithLiquid(Walker walker)
    {
       PVector pos = walker.position;
       return pos.x > this.x - this.horizon &&
              pos.x < this.x + this.horizon && 
              pos.y < this.y;
      
    }
    
    public PVector calculateDragForce(Walker walker)
    {
      float speed = walker.velocity.mag();
      float dragMagnitude = this.cd * speed * speed;
      
      PVector dragForce = walker.velocity.copy().mult(-1);
      
      dragForce.normalize();
      dragForce.mult(dragMagnitude);
      return dragForce;
      
    }
}
