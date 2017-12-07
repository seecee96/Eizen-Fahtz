[24,36,48,60] @=> int lowOctave[];
[60,72,84,96] @=> int hiOctave[];
[41,53,65,77] @=> int forth[];
[43,55,67,79] @=> int fifth[];
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
string z;

int y;

ModalBar fifth1 => Echo e=> Chorus c => NRev r=> PRCRev p =>LPF f =>PitShift m4 => PitShift m5 =>PitShift m44 => PitShift m55 =>Gain g=>PRCRev master =>Gain g2=>Dyno l=>dac;
ModalBar hiOct1 =>Echo  e2=> Chorus c1 => NRev r1=> PRCRev p1 =>LPF f1=>PitShift m => PitShift m1 =>PitShift m0 => PitShift m11 =>g=>master;
ModalBar  forth1=> e=> Chorus c2 => NRev r2=> PRCRev p2 =>LPF f2=>PitShift m6 => PitShift m7 =>PitShift m66 => PitShift m77 =>g=>master;
ModalBar lowOct1 => e2=> Chorus c3 => NRev r3=> PRCRev p3 =>LPF f3=>PitShift m2 => PitShift m3 =>PitShift m22 => PitShift m33 =>g=>master; //add g Gain again 

l.limit();
.00062=>master.mix;
.28=>float gg;
gg=>g.gain;
2.5=>float gg2;
gg2=>g2.gain;
//limit.limit;
.051=>e.mix;
.072=>e2.mix;
0=>float mg;
mg=>m.mix;
0=>float mg1;
mg1=>m1.mix;;
0=>float mg2;
mg2=>m2.mix;
0=>float mg3;
mg3=>m3.mix;
0=>float mg4;
mg4=>m4.mix;
0=>float mg5;
mg5=>m5.mix;
0=>float mg6;
mg6=>m6.mix;
0=>float mg7;
mg7=>m7.mix;
1.3333333333333=>m.shift;
1.5=>m1.shift;
1.3333333333333=>m2.shift;
1.5=>m3.shift;
1.3333333333333=>m5.shift;
1.5=>m4.shift;
1.3333333333333=>m7.shift;
1.5=>m6.shift;




0=>float mg0;
mg0=>m0.mix;
0=>float mg11;
mg11=>m11.mix;;
0=>float mg22;
mg22=>m22.mix;
0=>float mg33;
mg33=>m33.mix;
0=>float mg44;
mg44=>m44.mix;
0=>float mg55;
mg55=>m55.mix;
0=>float mg66;
mg66=>m66.mix;
0=>float mg77;
mg77=>m77.mix;


12=>m0.shift;
6=>m11.shift;
12=>m22.shift;
6=>m33.shift;
12=>m55.shift;
6=>m44.shift;
12=>m77.shift;
6=>m66.shift;






0=>int yes1;
0=>int yes2;
0=>int yes3;
0=>int yes4;
0=>int yes5;
0=>int yes6;
0=>int yes7;
0=>int yes8;
0=>int yes9;
0=>int yes10;
0=>int yes11;
0=>int yes12;
0=>int yes13;
0=>int yes14;
0=>int yes15;
0=>int yes16;
 if(gg>1.5)
 {
     1.5=>gg;
     gg=>g.gain;
 }

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
                
                
               
                
                
                
                
                
                //SIDES
                if(x=="right")
                {
                   
                     Math.random2(72,125)::ms=>now;
                    
                    Std.mtof(fifth[Math.random2(0,3)])=> fifth1.freq;
Math.random2f(.41,.85)=> fifth1.strikePosition;
                     Math.random2f(.37,1)=> fifth1.damp;
                    
                    Math.random2f(400,1350)=> f.freq;
Math.random2f(.1,.34)=>f.Q;


Math.random2f(.0273,.0537)=>c.mix;
//Math.random2f(2,4)=>c.modFreq;
//Math.random2f(.05,.1)=>c.modDepth;
Math.random2f(.1,.2)=>r.mix;
Math.random2f(.175,.315)=>p.mix;
                  1=>  fifth1.strike;
                    
                   // <<<"hit">>>;
                 4::ms=>now;
                }
                    if(x=="left")
                {
                      Math.random2(72,125)::ms=>now;
                    
                    Std.mtof(forth[Math.random2(0,3)])=> forth1.freq;
Math.random2f(.41,.95)=> forth1.strikePosition;
                     Math.random2f(.37,1)=> forth1.damp;
                    
                    Math.random2f(400,1350)=> f2.freq;
Math.random2f(.1,.34)=>f2.Q;


//Math.random2f(2,4)=>c2.modFreq;
//Math.random2f(.05,.1)=>c2.modDepth;
Math.random2f(.0273,.0537)=>c2.mix;
Math.random2f(.1,.2)=>r2.mix;
Math.random2f(.175,.315)=>p2.mix;
                  1=>  forth1.strike;
                    
                  //  <<<"hit">>>;
                 4::ms=>now;
                }
                          if(x=="top")
                {
                    
                     Math.random2(72,125)::ms=>now;
                   
                    Std.mtof(hiOctave[Math.random2(0,3)])=> hiOct1.freq;
Math.random2f(.41,.95)=> hiOct1.strikePosition;
                     Math.random2f(.37,1)=> hiOct1.damp;
                    
                    Math.random2f(400,1350)=> f1.freq;
Math.random2f(.1,.34)=>f1.Q;


//Math.random2f(2,4)=>c1.modFreq;
//Math.random2f(.05,.1)=>c1.modDepth;
Math.random2f(.0273,.0537)=>c1.mix;
Math.random2f(.1,.2)=>r1.mix;
Math.random2f(.175,.315)=>p1.mix;
                  1=>  hiOct1.strike;
                    
                 //   <<<"hit">>>;
                 4::ms=>now;
                }
                          if(x=="bottom")
                {
                     Math.random2(72,125)::ms=>now;
                    
                    Std.mtof(lowOctave[Math.random2(0,3)])=> lowOct1.freq;
Math.random2f(.41,.95)=> lowOct1.strikePosition;
                     Math.random2f(.37,1)=> lowOct1.damp;
                    
                    Math.random2f(400,1350)=> f3.freq;
Math.random2f(.1,.34)=>f3.Q;


//Math.random2f(2,4)=>c3.modFreq;
//Math.random2f(.05,.1)=>c3.modDepth;
Math.random2f(.0273,.0537)=>c3.mix;
Math.random2f(.1,.2)=>r3.mix;
Math.random2f(.175,.315)=>p3.mix;
                  1=>  lowOct1.strike;
                    
                //    <<<"hit">>>;
                 4::ms=>now;
                }
            } 
            //if the message from osc is //circles...
            if(msg.address == "/button")
            {
                //extracts data (nt) from message
                msg.getString(0) => z;
                
                //BUTTONS
                
                //PITCH SHIFT
               
                if(z=="button1On")
                {
                    
                    .6=>m.mix;
                    if(yes1==0)
                        {
                            yes1+1=>yes1;
                        }
                    gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button1on">>> ;
                    5::ms=>now;
                }
              
                
                if(z=="button1Off")
                {
                    0=>m.mix;
                    if(yes1==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes1-1=>yes1;
                    }
                  <<<"button1off">>> ; 
                    5::ms=>now;
                }
                
                                       

                
                
                 if(z=="button4On")
                {
                    if(yes2==0)
                        {
                            yes2+1=>yes2;
                        }
                    .6=>m1.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button4on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button4Off")
                {
                    0=>m1.mix;
                    
                     if(yes2==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes2-1=>yes2;
                    }
                  <<<"button4off">>> ; 
                       5::ms=>now;
                }
                
                
                
                if(z=="button13On")
                {
                    if(yes3==0)
                        {
                            yes3+1=>yes3;
                        }
                    .6=>m2.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button13on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button13Off")
                {
                    0=>m2.mix;
                     if(yes3==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes3-1=>yes3;
                    }
                  <<<"button13off">>> ; 
                    5::ms=>now;
                }
                
                                       

                
                
                 if(z=="button16On")
                {
                     if(yes4==0)
                    {
                   
                        yes4+1=>yes4;
                    }
                    .6=>m3.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button16on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button16Off")
                {
                    0=>m3.mix;
                   if(yes4==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes4-1=>yes4;
                    }
                  <<<"button16off">>> ; 
                       5::ms=>now;
                }
                
                
                 if(z=="button8On")
                {
                     if(yes5==0)
                    {
                  
                        yes5+1=>yes5;
                    }
                    .6=>m4.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button8on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button8Off")
                {
                    0=>m4.mix;
                   if(yes5==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes5-1=>yes5;
                    }
                  <<<"button8off">>> ; 
                       5::ms=>now;
                }
                
                   if(z=="button12On")
                {
                     if(yes6==0)
                    {
                   
                        yes6+1=>yes6;
                    }
                    .6=>m5.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button12on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button12Off")
                {
                    0=>m5.mix;
                     if(yes6==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes6-1=>yes6;
                    }
                  <<<"button12off">>> ; 
                       5::ms=>now;
                }
                
                 if(z=="button5On")
                {
                     if(yes7==0)
                    {
                   
                        yes7+1=>yes7;
                    }
                    .6=>m6.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button5on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button5Off")
                {
                    0=>m6.mix;
                    if(yes7==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes7-1=>yes7;
                    }
                  <<<"button5off">>> ; 
                       5::ms=>now;
                }
                
                   if(z=="button9On")
                {
                     if(yes8==0)
                    {
                    
                        yes8+1=>yes8;
                    }
                    .6=>m7.mix;
                      gg-.15=>gg;
                    gg=>g.gain;
                   <<<"button9on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button9Off")
                {
                    0=>m7.mix;
                     if(yes8==1)
                    {
                    gg+.15=>gg;
                       gg=>g.gain;
                        yes8-1=>yes8;
                    }
                  <<<"button9off">>> ; 
                       5::ms=>now;
                }
                //HI PASS
                //hi octave
                  if(z=="button3On")
                {
                     if(yes9==0)
                    {
                    
                        yes9+1=>yes9;
                    }
                   .45=>m11.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   <<<"button3on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button3Off")
                {
                    0=>m11.mix;
                      if(yes9==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes9-1=>yes9;
                    }
                  <<<"button3off">>> ; 
                       5::ms=>now;
                }
                //fifth
                    if(z=="button7On")
                {
                      if(yes10==0)
                    {
                    
                        yes10+1=>yes10;
                    }
                     .45=>m44.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   <<<"button7on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button7Off")
                {
                     0=>m44.mix;
                      if(yes10==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes10-1=>yes10;
                    }
                  <<<"button7off">>> ; 
                       5::ms=>now;
                }
                
                //fourth
                    if(z=="button11On")
                {
                      if(yes11==0)
                    {
                    
                        yes11+1=>yes11;
                    }
                     .45=>m55.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   <<<"button11on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button11Off")
                {
                     0=>m55.mix;
                      if(yes11==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes11-1=>yes11;
                    }
                  <<<"button11off">>> ; 
                       5::ms=>now;
                }
                
                //low octave
                    if(z=="button15On")
                {
                      if(yes12==0)
                    {
                    
                        yes12+1=>yes12;
                    }
                     .45=>m33.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                  
                   
                   <<<"button15on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button15Off")
                {
                     0=>m33.mix;
                     if(yes12==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes12-1=>yes12;
                    }
                  <<<"button15off">>> ; 
                       5::ms=>now;
                }
                
                //LOW PASS
               
               //hi octave
                  if(z=="button2On")
                {
                      if(yes13==0)
                    {
                    
                        yes13+1=>yes13;
                    }
                   .45=>m0.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   
                   <<<"button2on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button2Off")
                {
                   0=>m0.mix;
                      if(yes13==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes13-1=>yes13;
                    }
                  
                  <<<"button2off">>> ; 
                       5::ms=>now;
                }
                //fifth
                    if(z=="button6On")
                {
                      if(yes14==0)
                    {
                    ;
                        yes14+1=>yes14;
                    }
                     .45=>m66.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   <<<"button6on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button6Off")
                {
                     0=>m66.mix;
                     if(yes14==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes14-1=>yes14;
                    }
                  <<<"button6off">>> ; 
                       5::ms=>now;
                }
                
                //fourth
                    if(z=="button10On")
                {
                      if(yes15==0)
                    {
                  
                        yes15+1=>yes15;
                    }
                     .45=>m77.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   <<<"button10on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button10Off")
                {
                     0=>m77.mix;
                      if(yes15==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes15-1=>yes15;
                    }
                  <<<"button10off">>> ; 
                       5::ms=>now;
                }
                
                //low octave
                    if(z=="button14On")
                {
                      if(yes16==0)
                    {
                   
                        yes16+1=>yes16;
                    }
                    .45=>m22.mix;
                    gg-.05=>gg;
                    gg=>g.gain;
                   
                   
                   <<<"button14on">>> ;
                    5::ms=>now;
                }
                
                if(z=="button14Off")
                {
                     0=>m22.mix;
                      if(yes16==1)
                    {
                    gg+.05=>gg;
                       gg=>g.gain;
                        yes16-1=>yes16;
                    }
                    
                    
                  <<<"button14off">>> ; 
                       5::ms=>now;
                    
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


