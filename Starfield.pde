ArrayList <Particle> pList = new ArrayList <Particle> ();
int pListSize = 500;

void setup()
{
  size(800, 600);
  for (int i = 0; i < pListSize; i++)
  {
    pList.add(new Particle());
  }
  pList.set(pList.size()-1, new OddballParticle());     //YOU SAID SLOT 1 BUT IT WAS BEHIND EVERYTHING LIKE THAT, SO I PUT IT LAST INSTEAD
}

void draw()
{
  clear();
  for (Particle p : pList)
  {
    p.move();
    p.show();
  }
}

class Particle
{
  int sz, cl; //size, color
  double x, y, sp, an; //x, y, speed, angle
  Particle()
  {
    sz = 20;
    cl = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    x = width/2 + (int)(Math.random()*width/2) - width/4;
    y = height/2 + (int)(Math.random()*height/2) - height/4;
    sp = Math.random()*10;
    an = (int)(Math.random()*361);
  }
  void move()
  {
    x += Math.cos(an)*sp;
    y += Math.sin(an)*sp;
    if (x >= width)
    {
      x = 0;
    }
    else if (x <= 0)
    {
      x = width;
    }
    else if (y >= height)
    {
      y = 0;
    }
    else if (y <= 0)
    {
      y = height;
    }
  }
  void show()
  {
    fill(cl);
    ellipse((float)x, (float)y, (float)sz, (float)sz);
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    sz = 40;
    cl = color(255, 255, 255);
    x = width/2;
    y = height/2;
  }
  void move()
  {
    x += Math.cos(an)*sp;
    y += Math.sin(an)*sp;
    if (x >= width)
    {
      x = width;
      an = (int)(Math.random()*361);
    }
    else if (x <= 0)
    {
      x = 0;
      an = (int)(Math.random()*361);
    }
    else if (y >= height)
    {
      y = height;
      an = (int)(Math.random()*361);
    }
    else if (y <= 0)
    {
      y = 0;
      an = (int)(Math.random()*361);
    }
  }
}
