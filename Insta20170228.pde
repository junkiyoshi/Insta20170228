
float angle;

Particle _r;
Particle _g;
Particle _b;

ArrayList<Particle> particles;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  blendMode(ADD);
  
  angle = 0;
  float size = 10;
  
  _r = new Particle(new PVector(0, 0, 0), size);
  _r.change_color(255, 0, 0);
  _g = new Particle(new PVector(0, 0, 0), size);
  _g.change_color(0, 255, 0);
  _b = new Particle(new PVector(0, 0, 0), size);
  _b.change_color(0, 0, 255);
  
  size = 3;
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 512 * 4; i++)
  {
    particles.add(new Particle(new PVector(random(width), random(height), random(-height / 2, height / 2)), size));
  }
}

void draw()
{
  background(0);
  
  angle = (angle + 1) % 360;
    float radius = 800;
    float x = radius * cos(radians(angle));
    float z = radius * sin(radians(angle));
    
  camera(x + width / 2.0, height / 2.0, z, 
         width / 2.0, height / 2.0, 0.0, 
         0.0, 1.0, 0.0);
  
  _r.move();
  _g.move();
  _b.move();
  
  _r.display();
  _g.display();
  _b.display();
  
  for(Particle p : particles)
  {
    p.update();
    p.display();
  }

  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}