import processing.serial.*;
import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer fart1;
AudioPlayer fart2;

Serial myPort;
String val;
int shouldPlay = 0;
int isPlaying = 0;

int fartPitch;
int fartVolume;
int buttonOn;
int switchOn;
int farting = 0;
int fartOnePlayed = 0;
int fartTwoPlayed = 0;
int fartOk = 0;

TickRate rateControl;
FilePlayer filePlayer1;
FilePlayer filePlayer2;
String fileName1 = "fart1.wav";
String fileName2 = "fart2.wav";
AudioOutput out;
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
  
  filePlayer1 = new FilePlayer (minim.loadFileStream(fileName1));
  filePlayer2 = new FilePlayer (minim.loadFileStream(fileName2));
  
  //filePlayer1.loop();
  //filePlayer2.loop();
  
  out = minim.getLineOut();
  filePlayer1.patch(out);
  filePlayer2.patch(out);
  
  //rateControl = new TickRate(1.f);
  //out = minim.getLineOut();
  //fart1.patch(rateControl).patch(out);
  //fart2.patch(rateControl).patch(out);
  
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
    fartVolume = vals[0];
    fartPitch = vals[1] ;
    switchOn = vals[2];
    buttonOn = vals[3];
    
    float gain = map(fartVolume, 0, 4095, -15.0, 15.0);
    float pan = map(fartPitch, 0, 4095, -1.0, 1.0);
    fart1.setGain(gain);
    fart2.setGain(gain);
    fart1.setPan(pan);
    fart2.setPan(pan);
    
  
    println(fartVolume + " " + fartPitch + " " + switchOn + " " + buttonOn);
  
  if (buttonOn == 1)
     {
       //farting = 1;
       if (switchOn == 0)
       {
         farting = 1;
         //println(farting);
         fartOnePlayed = 1;
         //fart1.play();
         filePlayer1.play();
       }
       else if (switchOn == 1)       
       {
         fartTwoPlayed = 1;
         filePlayer2.play();
       }
       //fartOk = 1;

     }
  if (buttonOn == 0);
     {
       if (filePlayer1.isPlaying())
       //filePlayer1.pause();
       farting = 0;
       if (fartOnePlayed == 1)
       {
       filePlayer1.rewind();
       fartOnePlayed = 0;
       }
       if (fartTwoPlayed == 1)
       {
       filePlayer2.rewind();
       fartTwoPlayed = 0;
       }
     }
  }

}
