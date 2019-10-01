import processing.serial.*;
import processing.sound.*;
SoundFile fart1;
//SoundFile fart2;

Serial myPort;
String val;

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
  fart1 = new SoundFile(this, "fart1.wav");
  //println(Serial.list());
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');         // read it and store it in val
  }  

//val = myPort.readStringUntil('\n');         // read it and store it in val
  if (keyPressed == true) 
  {                           //if we clicked in the window
   myPort.write('1');//send a 1
   fart1.play();
  // println("1");   
  } else 
  {                           //otherwise
  myPort.write('0');          //send a 0
  }   
  
println(val); //print it out in the console
}
