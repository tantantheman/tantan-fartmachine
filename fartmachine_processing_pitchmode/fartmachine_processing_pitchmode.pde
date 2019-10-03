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


FilePlayer filePlayer1;
FilePlayer filePlayer2;
String fileName1 = "fart1.wav";
String fileName2 = "fart2.wav";
TickRate rateControl;
Gain gain;
AudioOutput out;
boolean firstContact = false;

void setup()
{
  frameRate(240); 

  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  minim = new Minim(this);

  filePlayer1 = new FilePlayer (minim.loadFileStream(fileName1));
  filePlayer2 = new FilePlayer (minim.loadFileStream(fileName2));
  gain = new Gain(0.f);
  rateControl = new TickRate(1.f);
  out = minim.getLineOut();
  rateControl.setInterpolation(true);
  filePlayer1.patch(rateControl).patch(gain).patch(out);
  filePlayer2.patch(rateControl).patch(gain).patch(out);
  
  
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
    
    float db = map(fartVolume, 0, 4095, -10, 15);
    gain.setValue(db);
    float rate = map(fartPitch, 0, 4095, 0.8f, 3.f);
    rateControl.value.setLastValue(rate);
    
    println(fartVolume + " " + fartPitch + " " + switchOn + " " + buttonOn);
  
  if (buttonOn == 1)
     {
       if (switchOn == 0)
       {
         println("fart1");
         fartOnePlayed = 1;
         filePlayer1.play();
       }
       else if (switchOn == 1)       
       {
         println("fart2");
         fartTwoPlayed = 1;
         filePlayer2.play();
       }
     }
  if (buttonOn == 0);
     {
       if (fartOnePlayed == 1)
       {
         println("FART1REWIND");
       filePlayer1.rewind();
       fartOnePlayed = 0;
       }
       if (fartTwoPlayed == 1)
       {
       println("FART2REWIND");
       filePlayer2.rewind();
       fartTwoPlayed = 0;
       filePlayer2.mute();
       }
     }
  }

}
