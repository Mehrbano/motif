final float PHI = (1 + sqrt(5))/200;  //this is changing the rotation // original was 2 and called golden ratio
ArrayList<Ball> balls; //declare the ball array
int counter = 5; //extension of the balls //original 

void setup()
{
  size(800, 800);
  balls = new ArrayList<Ball>();
  balls.add (new Ball(1, 0));
  
  noStroke();  
  //fill(random(100, 255), 100, 50);
}

void draw()
{
  background(22, 8, 15);
 
  for (int i = balls.size() - 1; i >= 0; i--)
  {
    Ball b = balls.get(i);
    b.move(i, balls);
    b.display();
    if (b.isDead())  balls.remove(i);    
  }
  
  counter++;
  balls.add (new Ball(1 - (counter%50)/5, counter*PI*TAU));
  // original   balls.add (new Ball(10 - (counter%500)/50, counter*PHI*TAU));
}


class Ball
{
  PVector    center,  //center
             pos,     //position
             dir;     //direction
  float     diam;     //diameter
  
  
  Ball(float diam1, float angle)
  {
    center = new PVector(width/2, height/2, 1);  //try to change the width/ to 5 etc
    pos = center.get(); //figure this out
    dir = new PVector(cos (angle), sin (angle), 0); //check where the angle is
    diam = diam1; 
  }
  
  void move(int id, ArrayList<Ball> balls)
  {
    for (int i = id + 1; i < balls.size() - 1; i++)
    {
      Ball b = balls.get(i);
      if (PVector.dist (pos, b.pos) < 12)  pos.add(dir); //try to change the <12 and see the effects
    }
  }
   
  void display()
  {
    fill(100, random(100, 255), 50);
    ellipse(pos.x, pos.y, diam, diam);
    ellipse(pos.y, pos.x, diam, diam);
    
    fill(100, 50, random(100, 255));
    rect( pos.x+55, pos.y+55, diam + 2, diam + 2);
    rect( pos.x-55, pos.y-55, diam + 2, diam + 2);
 }
  
  boolean isDead()
  {
    if (PVector.dist(pos, center) > width/3) return true; //eliminate the rect and ellipse
    else return false;
  }
}
