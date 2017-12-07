//Eizen Fahtz
//By, Riley Campbell
import themidibus.*;
import oscP5.*;
import netP5.*;
float cc[] = new float[100];
ArrayList<StrobeEye> StrobeEye = new ArrayList<StrobeEye>();
int accXin = 0;
int accYin = 0;
 float finalX,finalY;
 String direction;
 int eyes=7;

MidiBus myBus;
ParticleGen pGen;
ParticleGen1 pGen1;
ParticleGen2 pGen2;
ParticleGen3 pGen3;
ParticleGen4 pGen4;
ParticleGen5 pGen5;
ParticleGen6 pGen6;
ParticleGen7 pGen7;
ParticleGen8 pGen8;
ParticleGen9 pGen9;
ParticleGen10 pGen10;
ParticleGen11 pGen11;
ParticleGen12 pGen12;
ParticleGen13 pGen13;
ParticleGen14 pGen14;
ParticleGen15 pGen15;
ParticleGen16 pGen16;
ParticleGen17 pGen17;
ParticleGen18 pGen18;

//OSC YAY
OscP5 oscP5; //define osc object
NetAddress myRemoteLocation; //object to send data to



void setup()
{

 fullScreen();
//size(800,800);
//size(1700,910);

 MidiBus.list();
 myBus = new MidiBus(this, 0, 3);//numbers might need fixing?
 pGen = new ParticleGen();
 pGen1 = new ParticleGen1();
  pGen2 = new ParticleGen2();
   pGen3 = new ParticleGen3();
    pGen4 = new ParticleGen4();
     pGen5 = new ParticleGen5();
      pGen6 = new ParticleGen6();
       pGen7 = new ParticleGen7();
        pGen8 = new ParticleGen8();
         pGen9 = new ParticleGen9();
          pGen10 = new ParticleGen10();
           pGen11 = new ParticleGen11();
            pGen12 = new ParticleGen12();
             pGen13 = new ParticleGen13();
              pGen14 = new ParticleGen14();
               pGen15 = new ParticleGen15();
                pGen16 = new ParticleGen16();
                 pGen17 = new ParticleGen17();
                     pGen18 = new ParticleGen18();

 
 
 oscP5 = new OscP5(this, 12001); //set port to recieve in        //12001 and 12000 variables CANNOT be the same
 myRemoteLocation = new NetAddress("127.0.0.1",12000); // sending out port  //127.0.0.1 is your personal IP address, you can also use localHost to do the same thing
 
 for (int i =0; i<7; i++)
 {
  StrobeEye.add(new StrobeEye(finalX,finalY))  ; //runs and creates individual variables for all 10 Movers in array

 }
  
 
}
 
 


void draw()
{
  
   
  if(eyes==0)
  {
    background(0);
  }
   if(eyes==1)
  {
    background(random(0,18));
  }
   if(eyes==2)
  {
    background(random(18,36));
  }
   if(eyes==3)
  {
    background(random(36,54));
  }
   if(eyes==4)
  {
    background(random(54,72));
  }
   if(eyes==5)
  {
    background(random(72,90));
  }
   if(eyes==6)
  {
    background(random(90,108));
  }
   if(eyes==7)
  {
    background(random(108,126));
  }
   if(eyes==8)
  {
    background(random(126,144));
  }
 if(eyes==9)
  {
    background(random(144,162));
  }
   if(eyes==10)
  {
    background(random(162,180));
  }
   if(eyes==11)
  {
    background(random(180,198));
  }
   if(eyes==12)
  {
    background(random(198,216));
  }
   if(eyes==13)
  {
    background(random(216,234));
  }
   if(eyes==14)
  {
    background(random(234,249));
  }
   if(eyes==15)
  {
    background(255);
  }
  pGen.update();
  pGen.draw();
  pGen1.update();
  pGen1.draw();
   pGen2.update();
  pGen2.draw();
   pGen3.update();
  pGen3.draw();
   pGen4.update();
  pGen4.draw();
   pGen5.update();
  pGen5.draw();
   pGen6.update();
  pGen6.draw();
   pGen7.update();
  pGen7.draw();
   pGen8.update();
  pGen8.draw();
   pGen9.update();
  pGen9.draw();
   pGen10.update();
  pGen10.draw();
   pGen11.update();
  pGen11.draw();
   pGen12.update();
  pGen12.draw();
   pGen13.update();
  pGen13.draw();
   pGen14.update();
  pGen14.draw();
   pGen15.update();
  pGen15.draw();
   pGen16.update();
  pGen16.draw();
   pGen17.update();
  pGen17.draw();
  pGen18.update();
  pGen18.draw();
  for(int i =0; i <StrobeEye.size(); i++)
  {
     
    StrobeEye.get(i).update();
   StrobeEye.get(i).display();
   
      if(StrobeEye.get(i).alive==false)
      {
        StrobeEye.remove(i);
        i--;
       eyes--;
      }
      else
      {
      //calling update function from particle tab
     StrobeEye.get(i).update(); 
      }
    }
    if(mousePressed)
  {
    if(mouseButton==LEFT)
    {
     pGen.generate(new PVector(mouseX,mouseY));
    }
  }
 
  
  }



 void controllerChange( int channel, int number, int value)
{
 cc[number] = map(value,0,127,0,1);
  
 // println(channel);
  //println(number);
  // println(value);
   
   if(channel==15&&number==2&&value==1)
   {
   
      ellipseMode(CORNER);
   }
    if(channel==15&&number==2&&value==2)
   {
       ellipseMode(CENTER);
    
   }
    if(channel==15&&number==2&&value==3)
   {
     ellipseMode(RADIUS);
   }
     if(channel==15&&number==2&&value==4)
   {
     ellipseMode(CORNERS);
   }
   println(eyes);
   
    if(channel==15&&number==1&&value==2)
   {
     sendDirectionOsc("button1Off");
      sendDirectionOsc("button2Off");
       sendDirectionOsc("button3Off");
        sendDirectionOsc("button4Off");
         sendDirectionOsc("button5Off");
          sendDirectionOsc("button6Off");
           sendDirectionOsc("button7Off");
            sendDirectionOsc("button8Off");
             sendDirectionOsc("button9Off");
              sendDirectionOsc("button10Off");
               sendDirectionOsc("button11Off");
                sendDirectionOsc("button12Off");
                 sendDirectionOsc("button13Off");
                  sendDirectionOsc("button14Off");
                   sendDirectionOsc("button15Off");
                    sendDirectionOsc("button16Off");
                   
                     pGen18.generate(new PVector(960,540));
   }
    if(channel==15&&number==1&&value==3)
   {
     sendDirectionOsc("button1Off");
      sendDirectionOsc("button2Off");
       sendDirectionOsc("button3Off");
        sendDirectionOsc("button4Off");
         sendDirectionOsc("button5Off");
          sendDirectionOsc("button6Off");
           sendDirectionOsc("button7Off");
            sendDirectionOsc("button8Off");
             sendDirectionOsc("button9Off");
              sendDirectionOsc("button10Off");
               sendDirectionOsc("button11Off");
                sendDirectionOsc("button12Off");
                 sendDirectionOsc("button13Off");
                  sendDirectionOsc("button14Off");
                   sendDirectionOsc("button15Off");
                    sendDirectionOsc("button16Off");
                   
                     pGen18.generate(new PVector(960,540));
   }
     if(channel==15&&number==1&&value==4)
   {
     sendDirectionOsc("button1Off");
      sendDirectionOsc("button2Off");
       sendDirectionOsc("button3Off");
        sendDirectionOsc("button4Off");
         sendDirectionOsc("button5Off");
          sendDirectionOsc("button6Off");
           sendDirectionOsc("button7Off");
            sendDirectionOsc("button8Off");
             sendDirectionOsc("button9Off");
              sendDirectionOsc("button10Off");
               sendDirectionOsc("button11Off");
                sendDirectionOsc("button12Off");
                 sendDirectionOsc("button13Off");
                  sendDirectionOsc("button14Off");
                   sendDirectionOsc("button15Off");
                    sendDirectionOsc("button16Off");
                   
                     pGen18.generate(new PVector(960,540));
   }
   
   if(number==3&&value==127)
   {
      StrobeEye.add(new StrobeEye(finalX,finalY));
      eyes++;
   }
    if(number==4&&value==127)
   {
      StrobeEye.add(new StrobeEye(finalX,finalY));
       eyes++;
   }
   if(number==5&&value==127)
   {
      StrobeEye.add(new StrobeEye(finalX,finalY));
       eyes++;
   }
   if(number==6&&value==127)
   {
      StrobeEye.add(new StrobeEye(finalX,finalY));
       eyes++;
   }
     
  if(channel==1&&number ==1)//this is my x axis
  {
    finalX= value;
    finalX=finalX/127;
    finalX = finalX*displayWidth;
  }
  else if(channel==1&&number ==2)//this is my y axis
  {
    finalY= 127-value;//flip y axis to keep in accordance with midi controler
    
    finalY=finalY/127;
    finalY = finalY*displayHeight;
  }

//println(finalX);
//println(finalY);
 
  
}

void noteOn ( int Nchannel, int Nnumber, int Nvalue)
{
   println(Nchannel);
 println(Nnumber); 
    println(Nvalue);
   
    
    
    if(Nnumber==1&&Nvalue==127)
   {
     pGen1.generate(new PVector(440,240));
      sendDirectionOsc("button1On");
       
   }
      if(Nnumber==2&&Nvalue==127)
   {
     pGen2.generate(new PVector(740,240));
      sendDirectionOsc("button2On");
   }
      if(Nnumber==17&&Nvalue==127)
   {
     pGen3.generate(new PVector(1140,240));
      sendDirectionOsc("button3On");
   }
      if(Nnumber==18&&Nvalue==127)
   {
      sendDirectionOsc("button4On");
      pGen4.generate(new PVector(1440,240));
   }
      if(Nnumber==5&&Nvalue==127)
   {
     pGen5.generate(new PVector(440,440));
      sendDirectionOsc("button5On");
   }
      if(Nnumber==6&&Nvalue==127)
   {
     pGen6.generate(new PVector(740,440));
      sendDirectionOsc("button6On");
   }
      if(Nnumber==7&&Nvalue==127)
   {
     pGen7.generate(new PVector(1140,440));
      sendDirectionOsc("button7On");
   }
      if(Nnumber==8&&Nvalue==127)
   {
     pGen8.generate(new PVector(1440,440));
      sendDirectionOsc("button8On");
   }
      if(Nnumber==9&&Nvalue==127)
   {
     pGen9.generate(new PVector(440,640));
      sendDirectionOsc("button9On");
   }
      if(Nnumber==10&&Nvalue==127)
   {
     pGen10.generate(new PVector(740,640));
      sendDirectionOsc("button10On");
   }
      if(Nnumber==11&&Nvalue==127)
   {
     pGen11.generate(new PVector(1140,640));
      sendDirectionOsc("button11On");
   }
      if(Nnumber==12&&Nvalue==127)
   {
     pGen12.generate(new PVector(1440,640));
      sendDirectionOsc("button12On");
   }
      if(Nnumber==13&&Nvalue==127)
   {
     pGen13.generate(new PVector(440,840));
      sendDirectionOsc("button13On");
   }
      if(Nnumber==14&&Nvalue==127)
   {
     pGen14.generate(new PVector(740,840));
      sendDirectionOsc("button14On");
   }
      if(Nnumber==15&&Nvalue==127)
   {
     pGen15.generate(new PVector(1140,840));
      sendDirectionOsc("button15On");
   }
      if(Nnumber==16&&Nvalue==127)
   {
     pGen16.generate(new PVector(1440,840));
      sendDirectionOsc("button16On");
   }
}

void noteOff ( int Nchannel, int Nnumber, int Nvalue)
{
   println(Nchannel);
  println(Nnumber);
    println(Nvalue);
     
    
    
  if(Nnumber==1&&Nvalue==0)
   {
      sendDirectionOsc("button1Off");
      pGen17.generate(new PVector(440,240));
   }
      if(Nnumber==2&&Nvalue==0)
   {
      sendDirectionOsc("button2Off"); pGen17.generate(new PVector(740,240));
   }
      if(Nnumber==17&&Nvalue==0)
   {
      sendDirectionOsc("button3Off"); pGen17.generate(new PVector(1140,240));
   }
      if(Nnumber==18&&Nvalue==0)
   {
      sendDirectionOsc("button4Off"); pGen17.generate(new PVector(1440,240));
   }
      if(Nnumber==5&&Nvalue==0)
   {
      sendDirectionOsc("button5Off"); pGen17.generate(new PVector(440,440));
   }
      if(Nnumber==6&&Nvalue==0)
   {
      sendDirectionOsc("button6Off"); pGen17.generate(new PVector(740,440));
   }
      if(Nnumber==7&&Nvalue==0)
   {
      sendDirectionOsc("button7Off"); pGen17.generate(new PVector(1140,440));
   }
      if(Nnumber==8&&Nvalue==0)
   {
      sendDirectionOsc("button8Off"); pGen17.generate(new PVector(1440,440));
   }
      if(Nnumber==9&&Nvalue==0)
   {
      sendDirectionOsc("button9Off"); pGen17.generate(new PVector(440,640));
   }
      if(Nnumber==10&&Nvalue==0)
   {
      sendDirectionOsc("button10Off"); pGen17.generate(new PVector(740,640));
   }
      if(Nnumber==11&&Nvalue==0)
   {
      sendDirectionOsc("button11Off"); pGen17.generate(new PVector(1140,640));
   }
      if(Nnumber==12&&Nvalue==0)
   {
      sendDirectionOsc("button12Off"); pGen17.generate(new PVector(1440,640));
   }
      if(Nnumber==13&&Nvalue==0)
   {
      sendDirectionOsc("button13Off"); pGen17.generate(new PVector(440,840));
   }
      if(Nnumber==14&&Nvalue==0)
   {
      sendDirectionOsc("button14Off"); pGen17.generate(new PVector(740,840));
   }
      if(Nnumber==15&&Nvalue==0)
   {
      sendDirectionOsc("button15Off"); pGen17.generate(new PVector(1140,840));
   }
      if(Nnumber==16&&Nvalue==0)
   {
      sendDirectionOsc("button16Off"); pGen17.generate(new PVector(1440,840));
   }
    
}



  void sendDirectionOsc(String button)//_x is naming the variable locally
{
 OscMessage myMessage = new OscMessage("/button");  //creates called circles
 myMessage.add(button); //adds variable to message
 

 oscP5.send(myMessage, myRemoteLocation); //remote location is where you send your messages (aka 127.0.0.1 port 12000

 

}

void mousePressed() {
  
  if(mouseButton==RIGHT)
  {
   setup();
  }
}