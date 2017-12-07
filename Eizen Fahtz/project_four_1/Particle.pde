import oscP5.*;
import netP5.*;


class Particle
{
 PVector position, velocity,acceleration;
 color myColor;
 int size;
 boolean alive;
 float age;
 
 //constructor
 Particle()
 {
   alive = true;
   age=0;
  position = new PVector(); 
  velocity = new PVector(); 
  acceleration = new PVector(); 
  size=int(random(0,25));
  

   
 }
 void update()
 {
   
//+= adds a given number to a variable, then makes the variable equal to the sum
   age+=0.0000000004;
   
   if( age>=1.0)
   {
     alive= false;
   }
   
   //logic of moving the particle(s)
   velocity.add(acceleration);
   position.add(velocity);
   //makes size decay over time, same concept as video game smoke
   
   //fux wit dat number - age
   size = int(size*(1-age));
 }
 
 void draw()
 {
 

   //the second number makes it decay over time, like video game smoke
   
fill(myColor, int(255.0/(1.0-age)));
      //fill(myColor);

   ellipse(position.x,position.y, size*int(random(.3,5.8)), size*int(random(.7,3.2)));
   
   
 }
 
 
 
}