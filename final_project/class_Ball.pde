class Ball {
  
  color colour;                 // Ball colour.
  float dx, dy;                  // Movement increments.
  PVector pos, vel;
 
  float diameter;
  Ball(float mouseX, float mouseY, float diameter1) {
    pos = new PVector(mouseX, mouseY);

    vel = new PVector();
    diameter= diameter1;
    colour = color(random(255), random(255), random(255));
    
    dx = random(-2, 2);
    dy = random(-2, 2);
  }
  void update() {
    
    PVector newvel = new PVector(mouseX-width/2, mouseY-height/2);
    newvel.setMag(8);
    vel.lerp(newvel, 0.2);
    pos.add(vel);
  }
  boolean eats(Ball other)
  {
    float d = PVector.dist(pos, other.pos);
    if (d < diameter + other.diameter) {
      float sum = PI * diameter * diameter + PI * other.diameter * other.diameter;
      diameter = sqrt(sum / PI);

      return true;
    } else {
      return false;
    }
  }
  void draw() {
    fill(colour);
    noStroke();
    //ellipse(mouseX , mouseY, diameter*2, diameter*2);
    ellipse(pos.x, pos.y, diameter*2, diameter*2);
    //circle(mouseX,mouseY,30);
  }
  void move()
  {
    pos.x = pos.x+dx;
    pos.y = pos.y+dy;
  }
}
