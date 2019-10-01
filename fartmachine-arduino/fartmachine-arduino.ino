
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
    Serial.println("");
  } 

  xVal = analogRead(xPin);
  yVal = analogRead(yPin);
  joySwitchVal = digitalRead(joySwitch);
  Serial.println(xVal);
  Serial.println(yVal);
  Serial.println(joySwitchVal);
  Serial.println("");

  
}
