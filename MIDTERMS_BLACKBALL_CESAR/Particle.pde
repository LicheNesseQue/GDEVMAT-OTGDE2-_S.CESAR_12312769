public class Particle {

  //AT THIS POINT JUST MAKE IT INTO A CONSTRUCTOR WTF (Update: Idk how)

  PVector position = new PVector();
  PVector velocity = new PVector(0,0);
  float scale;
  color col;
  // IF IT LOOKS LIKE A CONSTRUCTOR, SOUNDS LIKE A CONSTRUCTOR, ACTS LIKE A CONSTRUCTOR,BUT ISN'T CONSTRUCTED LIKE A CONSTRUCTOR THE "CODER" SUCKS


  public void Render() {

    noStroke();
    fill(col);
    circle(position.x, position.y, scale);
  }

  public void Update() {
    PVector force = PVector.sub(blackHole, position);
    force.normalize();
    force.mult(0.5); // Control attraction strength
    velocity.add(force);
    position.add(velocity);
  }


  // [testing code UNUSED]
  public void draw() {
    fill(col);

    circle(position.x, position.y, scale);
  }
}
