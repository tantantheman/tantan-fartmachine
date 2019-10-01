import processing.serial.*;
//import processing.sound.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

Serial myPort;
String val;
int shouldPlay = 0;
int isPlaying = 0;

boolean firstContact = false;


void setup()
{
  frameRate(240);
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  minim = new Minim(this);
  player = minim.loadFile("fart1.wav");
  //println(Serial.list());
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  val=val.trim();
  }  
  
  if (val != null) 
  {   
   
    //if we clicked in the window
   //myPort.write('1');//send a 1
   //println(val);
   if (val.equals("on") && isPlaying == 0)
   {
     isPlaying = 1;
     println(val);
     player.play();
     delay(1900);
     val = "farted";
     //isPlaying = 0;
   }
   else 
   {
     player.rewind();
     println(val);
     isPlaying = 0;
     //val = "played";
   }
  }
  
}
