Particle[] particles;
public void setup()
{
  size(500,500);
  particles = new Particle[1000];
  for (int i = 0; i < particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].show();
    particles[i].move();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor;
  NormalParticle()
  {
    myX = myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*15;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256)); 
  }
  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY,5,5);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor;
  OddballParticle()
  {
    myX = 0;
    myY = 250;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256)); 
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*10);
  }
  public void show()
  {
    rect((float)myX,(float)myY,10,10);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY,20,20);
  }
}