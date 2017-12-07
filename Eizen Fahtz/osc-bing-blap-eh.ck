
//create osc input object
OscIn oscin; 
//create osc message
OscMsg msg;


//set our port from myRemoteLocation from processing
12000 => oscin.port;
//tell osc to listen to all messages
oscin.listenAll();

//create variables for input values
string x;
int y;

BeeThree b =>Chorus c =>Gain g=>dac;
TubeBell t=>g;

HevyMetl h=>LPF l=>Chorus c1=>g;
//VoicForm
440=>l.freq;
.69=>b.gain;
.12=>h.gain;

.12=>t.gain;
.33=>c.mix;
.24=>c1.mix;
1.33=>g.gain;

fun void oscPoller()
{
    while(true)
    {
        //
        oscin => now;
        //while the osc is reciving a message..
        while(oscin.recv(msg) != 0)
        {
            
            //if the message from osc is //circles...
            if(msg.address == "/direction")
            {
                //extracts data (nt) from message
                msg.getString(0) => x;
                
                
               //MOUSE
                if(x=="mouse")
                {
                    
                     
                    msg.getInt(1)/110=>b.freq;
                     msg.getInt(2)/110=>b.lfoSpeed;
                    msg.getInt(1)/110=>b.freq;
                     msg.getInt(2)/110=>b.lfoSpeed;
                     msg.getInt(2)/110=>t.freq;
                     msg.getInt(2)/110=>t.lfoSpeed;
                        msg.getInt(1)/13=>h.freq;
                     msg.getInt(2)/13=>h.lfoSpeed;
                     msg.getInt(1)/180=>c.modFreq;
                   msg.getInt(2)/405=>c.modDepth;
                        msg.getInt(1)/240=>c1.modFreq;
                   msg.getInt(2)/405=>c1.modDepth;
                    
                   
                    //msg.getInt(2)=>
                   1=>b.noteOn;
                    1=>h.noteOn;
                     1=>t.noteOn;
                    
                        10::ms=>now;
                    
                   
                    
                    1=>b.noteOff;
                    1=>h.noteOff;
                    1=>t.noteOff;
                }
                
                
                
                
               
                }
            } 
        }
    }
    


//spork the Poller
spork ~ oscPoller();





 while(1)
 {
     1::second =>now;
 };


