
/*Things to do:
 * 
 * Turn on an LED when the device is on. When the button is pressed
 * have the LED turn off. The switch changes the color of the LED
 * based on the fart track.
 * 
 */

const int buttonPin = 17;
const int xPin = 4;
const int yPin = 26;
const int joySwitch = 23;
const int ledPin = 2;
//const int LED_BUILTIN = 2;

char val;

int buttonVal;
int xVal;
int yVal;
int joySwitchVal;

void setup() {
  // put your setup code here, to run once:

  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(joySwitch, INPUT_PULLUP);
  pinMode(ledPin, OUTPUT);
  //pinMode(LED_BUILTIN, OUTPUT);
  
  Serial.begin(9600);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.println("Hello, world!");
  buttonVal = digitalRead(buttonPin);
   if (buttonVal == 0)
  {
    Serial.println("");
    Serial.println("Button Pressed");
    digitalWrite(ledPin, HIGH);
    Serial.println("");
  } 
  else
  {
    digitalWrite(ledPin, LOW);
  }

  if (Serial.available()) 
   { // If data is available to read,
     val = Serial.read(); // read it and store it in val
   }
   if (val == '1') 
   { // If 1 was received
     digitalWrite(ledPin, HIGH); // turn the LED on
   } else {
     digitalWrite(ledPin, LOW); // otherwise turn it off
   }
   //delay(10); // Wait 10 milliseconds for next reading
 
  xVal = analogRead(xPin);
  yVal = analogRead(yPin);
  joySwitchVal = digitalRead(joySwitch);
  Serial.println(xVal);
  Serial.println(yVal);
  Serial.println(joySwitchVal);
  Serial.println("");

  
}
