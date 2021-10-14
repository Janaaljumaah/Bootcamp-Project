Ball ball;
ArrayList<Ball> balls;

// Declare an array of ball objects.
//float mouseX;
//float mouseY;
//float diameter;
//float zoom = 1;
import processing.sound.*;
SoundFile mySample;
void setup()
{
  size(800, 800);
  mySample  = new SoundFile(this,"p06.wav");
  ball = new Ball(0, 0, 30);
  balls = new ArrayList<Ball>();
  
  for (int i=0; i<100; i++)
  {

   float x = random(-width,width );//width);
    float y = random(-height,height);// height);

    balls.add(new Ball(x, y, 16));
  }
}


void draw() {
  background(254, 244, 232);

  translate(width/2, height/2);
 translate(-ball.pos.x, -ball.pos.y);
  
  



  for (int i = balls.size()-1; i >=0; i--) {
    balls.get(i).draw();
    if (ball.eats(balls.get(i))) {
      balls.remove(i);
      mySample.play();
    }
  }
  
  ball.draw();
  ball.update();
  
 for (Ball ball : balls)
 {
  ball.move();
  }
}
