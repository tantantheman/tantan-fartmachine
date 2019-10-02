import processing.serial.*;
//import processing.sound.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

Serial myPort;
String val;
int shouldPlay = 0;
int isPlaying = 0;

int x;
int y;
int b;

boolean firstContact = false;


void setup()
{
  frameRate(240); 
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  minim = new Minim(this);
  player = minim.loadFile("fart1.wav");
  //println(Serial.list());
}

// data support from the serial port
void serialEvent(Serial portName) 
{
  // read the data until the newline n appears
  val = portName.readStringUntil('\n');
  
  if (val != null)
  {
        val = trim(val);
        
    // break up the decimal and new line reading
    int[] vals = int(splitTokens(val, ","));
    
    // we assign to variables
    x = vals[0];
    y = vals[1] ;
    b = vals[2];

  }
}

void draw()
{
  /* if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  //val=val.trim();
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
  } */
  
}
