class ParticleGen5
{
  
  //ArrayList is a smarter array. gives you more functions
  ArrayList<Particle> particles;
  
  //constructor
  ParticleGen5()
  {
   particles = new ArrayList<Particle>();
  }
  
  
  
  //the _ in position_ is to make it only exist in generate
void generate(PVector position_)
{
  Particle particle = new Particle();
  particles.add(particle);
  particle.position = position_;
  particle.velocity.set(0.5,0.5);
  particle.acceleration.set(0,.02);
  //lerpColor gives advrage between 2 colors to a given percent
  particle.myColor= color(255,128,0);
  particle.size = int(random(5,77));
  
}
 
  
  void update()
  {
    for(int i = 0; i<particles.size(); i++)
    {
      if(particles.get(i).alive==false)
      {
        particles.remove(i);
        i--;
      }
      else
      {
      //calling update function from particle tab
     particles.get(i).update(); 
      }
    }
  }
  
  void draw()
  {
   
    for(int i = 0; i<particles.size(); i++)
    {
      //calling update function from particle tab
     particles.get(i).draw(); 
    }
  }
}