


class StrobeEye
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  int mousex;
  int mousey;
  int mousepressed;
  float radius; //radius for ellipse
  float topSpeed; //
  int r1,r2,r3,r4,r5,r6,g1,g2,g3,g4,g5,g6,b1,b2,b3,b4,b5,b6,accXin,accYin,accrX,accrY; //colorz
  boolean alive;
  //CONSTRUCTOR
  StrobeEye(float finalX, float finalY)
  {
    alive=true;
   location = new PVector(random(0,width), random(0,height));
   velocity = new PVector(0,0); //start at 0 so acceleration does something
   acceleration = new PVector(0,1);
   radius = random(65,160); //can make variable
   topSpeed = random(8,18); //can make variable
   
   

       //accrX=(displayWidth*accXin)/127;
        //accrY=(displayHeight*accYin)/127;
        println(accrX);
    //start as green
   
  }
  
  //DISPLAY
  void display()
  {
    int RadRanX = int(random(2,7));
    int RadRanY = int(random(2,5));
    int RadRanX2 = int(random(4,15));
    int RadRanY2 = int(random(4,8));
    int ran1 = int(random(3,5));
   int ran2 = int(random(1,7));
   int ran3 = int(random(2,9));


  int Xloc = int(location.x);
  int Xran = int(random(1,10));
  int Yloc = int(location.y);
   r1=(Xloc+ran3/Xran);
    
   
   int Yran = int(random(1,7));
   if(Xloc==0)
   {
     Xloc = Xloc+1;
   }
     if(Yloc==0)
   {
     Yloc = Yloc+1;
   }
   b1 = Yloc/Yran-ran2;
   g1 = (Yloc-ran1/Xloc+ran2)/2;
   
      stroke(0);
   fill(r1,g1,b1);
   ellipse(location.x, location.y, radius, radius);
   
   
   
   
   
      int ran14 = int(random(3,5));
   int ran24 = int(random(1,7));
   int ran34 = int(random(2,9));


  int Xloc4 = int(location.x);
  int Xran4 = int(random(1,10));
  int Yloc4 = int(location.y);
   r3=(Xloc4+ran34*Xran4)*(RadRanX/4)/2;
    
   
   int Yran4 = int(random(1,7));
   if(Xloc4==0)
   {
     Xloc4 = Xloc4+1;
   }
     if(Yloc4==0)
   {
     Yloc4 = Yloc4+1;
   }
   b3 = (Yloc4*Yran4-ran24)/(3*RadRanX);
   g3 = (Yloc-ran14*Xloc+ran2)/3;
   
      stroke(0);
   fill(r3,g3,b3);
   ellipse(location.x, location.y, radius-RadRanX*10, radius-RadRanX*2);
  
 
 
  int ran12 = int(random(3,5));
   int ran22 = int(random(1,7));
   int ran32 = int(random(2,9));


  int Xloc2 = int(location.x);
  int Xran2 = int(random(1,10));
  int Yloc2 = int(location.y);
   r4=Xloc2+ran32/Xran2;
    
   
   int Yran2 = int(random(1,7));
   if(Xloc2==0)
   {
     Xloc2 = Xloc2+1;
   }
     if(Yloc2==0)
   {
     Yloc2 = Yloc2+1;
   }
   b4 = (Yloc2/Yran2-ran2)*6;
   g4 = (Yloc2-ran12/Xloc2+ran22)*3;
   
      stroke(0);
   fill(r4,g4,b4);
   ellipse(location.x, location.y, radius, radius/RadRanY);
   
   int ran13 = int(random(3,5));
   int ran23 = int(random(1,7));
   int ran33 = int(random(2,9));


  int Xloc3 = (int(location.x))/2;
  int Xran3 = int(random(1,10));
  int Yloc3 = (int(location.y))/2;
   r5=(Xloc2*2+ran32*Xran2)/7;
    
   
   int Yran3 = int(random(1,7));
   if(Xloc3==0)
   {
     Xloc3 = Xloc3+1;
   }
     if(Yloc3==0)
   {
     Yloc3 = Yloc3+1;
   }
   b5 = (Yloc3*Yran3-ran3)/3;
   g5 = (Yloc3-ran13*Xloc3+ran23)*RadRanX;
   
      stroke(0);
   fill(r5,g5,b5);
   ellipse(location.x, location.y, radius/RadRanX2*2, radius/RadRanY2*2);
   
   
   r2 = 0;
   g2 = 0;
   b2 = 0;
   
      stroke(0);
   fill(r2,g2,b2);
   ellipse(location.x, location.y, radius/15, radius/15);
   
   
   r6 = Xloc;
   

  }

   
  
  void update()
  {
    mousex=mouseX*1;
    mousey=mouseY;
    
   // println(mousex);
   //  println(mousex);
   //  println(mousey);
  //   println(mousey);
    if(isOutsideScreen())
   {
     alive= false;
   }
    
    
    
      float ran4 = random(.01,.3);
 
 
   PVector mouse = new PVector(finalX, finalY);
   PVector direction = PVector.sub(mouse, location);
   direction.normalize();
   direction.mult(ran4); //change for speed as well as some phizzics
   acceleration = direction;
     
   
   location.add(velocity);
   velocity.add(acceleration);
   velocity.limit(topSpeed+int(random(0,0)));
   
   
   checkEdges();
   
  }
  void checkEdges()
  {
   if (location.x > width )//right side (5th)
   {
      velocity.x = -velocity.x;
       sendDirectionOsc("right");
   }
 
   
   
   
   if ( location.x <0) //left side (4th)
   {
      velocity.x = -velocity.x;
    sendDirectionOsc("left");
    
   }
 
 
 
   
   
   
   
   if ( location.y < 0) //hi octave (top)
   {
     velocity.y = -velocity.y;
     sendDirectionOsc("top");
    
   }
  
   
   
   
   
   if (location.y > height)//low octave (bottom)
   {
     velocity.y = -velocity.y;
       sendDirectionOsc("bottom");
    
   }
 
   if(mousePressed)
   {
     sendDirectionOsc("mouse");
   }
   
   
  }

  void sendDirectionOsc(String direction)//_x is naming the variable locally
{
 OscMessage myMessage = new OscMessage("/direction");  //creates called circles
 myMessage.add(direction); //adds variable to message
  myMessage.add(mousex);
   myMessage.add(mousey);
 oscP5.send(myMessage, myRemoteLocation); //remote location is where you send your messages (aka 127.0.0.1 port 12000

 

}
   boolean isOutsideScreen()
 {
  if(location.x>width+11)
  {
    return true;
  }
  else if(location.x<-11)
  {
    return true;
  }
  else if(location.y>height+11)
  {
    return true;
  }
  else if(location.y<-11)
  {
    return true;
  }
  else
  {
   return false; 
  }
 }
}