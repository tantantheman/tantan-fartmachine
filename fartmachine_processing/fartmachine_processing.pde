import processing.serial.*;
import ddf.minim.*;
Minim minim;
AudioPlayer fart1;
AudioPlayer fart2;

Serial myPort;
String val;
int shouldPlay = 0;
int isPlaying = 0;

int x;
int y;
int buttonOn;
int switchOn;
int farting = 0;
int fartOnePlayed = 0;
int fartTwoPlayed = 0;
int fartOk = 0;

boolean firstContact = false;


void setup()
{
  frameRate(240); 
  //println(Serial.list());
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  minim = new Minim(this);
  fart1 = minim.loadFile("fart1.wav");
  fart2 = minim.loadFile("fart2.wav");
  //println(Serial.list());
}

// data support from the serial port
void serialEvent(Serial myPort) 
{
  // read the data until the newline n appears
  val = myPort.readStringUntil('\n');

}

void draw()
{
   if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); 
  //val=val.trim();
  }
    if (val != null)
  {
        val = trim(val);
        
    // break up the decimal and new line reading
    int[] vals = int(splitTokens(val, ","));
    
    // we assign to variables
    x = vals[0];
    y = vals[1] ;
    switchOn = vals[2];
    buttonOn = vals[3];
  
    println(x + " " + y + " " + switchOn + " " + buttonOn);
  
  if (buttonOn == 1)
     {
       //farting = 1;
       if (switchOn == 0)
       {
         farting = 1;
         println(farting);
         fartOnePlayed = 1;
         fart1.play();
       }
       else if (switchOn == 1)       
       {
         fartTwoPlayed = 1;
         fart2.play();
       }
       //fartOk = 1;

     }
  if (buttonOn == 0);
     {
       farting = 0;
       if (fartOnePlayed == 1)
       {
       fart1.rewind();
       fartOnePlayed = 0;
       }
       if (fartTwoPlayed == 1)
       {
       fart2.rewind();
       fartTwoPlayed = 0;
       }
     }
  }

}
