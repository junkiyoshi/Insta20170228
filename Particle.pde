class Particle
{
  PVector location;
  color body_color;
  
  float noise_x;
  float noise_y;
  float noise_z;
  
  float size;
  
  Particle(PVector l, float s)
  {
    location = l.copy();
    body_color = color(255, 255, 255);
    
    noise_x = random(10);
    noise_y = random(10);
    noise_z = random(10);
    
    size = s;
  }
  
  void move()
  {
    float x = map(noise(noise_x), 0, 1, 0, width);
    float y = map(noise(noise_y), 0, 1, 0, height);
    float z = map(noise(noise_z), 0, 1, -height / 2, height / 2);
    
    location = new PVector(x, y, z);
    
    noise_x += 0.05;
    noise_y += 0.05;
    noise_z += 0.05;
  }
  
  void update()
  {
    float r, g, b;
    
    r = PVector.dist(location, _r.location);
    g = PVector.dist(location, _g.location);
    b = PVector.dist(location, _b.location);
    
    if(r < 0 || r > 255)
    { 
      r = 0;
    }else
    {
      r = 255 - r;
    }
    if(g < 0 || g > 255)
    {
      g = 0; 
    }else
    {
      g = 255 - g;
    }
    if(b < 0 || b > 255)
    {
      b = 0; 
    }else
    {
      b = 255 - b;
    }
    
    change_color(r, g, b);
  }
  
  void change_color(float r, float g, float b)
  {
    body_color = color(r, g, b);
  }
  
  void display()
  {
    noStroke();
    fill(body_color);
    
    pushMatrix();
    translate(location.x, location.y, location.z);
    
    sphere(size);
    
    popMatrix();
  }
}