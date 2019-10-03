#include <SimpleMessageSystem.h>

/*Things to do:
 * 
 * Turn on an LED when the device is on. When the button is pressed
 * have the LED turn off. The switch changes the color of the LED
 * based on the fart track.
 * 
 */

const int buttonPin = 2;
const int xPin = 4;
const int yPin = 26;
const int joySwitch = 23;
const int switchPin = 14;

const int thingOn = 1;
const int thingOff = 0;

char val;

int buttonPushCounter = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button


int buttonVal;
int xVal;
int yVal;
int joySwitchVal;
int switchVal;

void setup() {
  // put your setup code here, to run once:

  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(joySwitch, INPUT_PULLUP);
  pinMode(switchPin, INPUT);
  
  Serial.begin(9600);
  
}

void loop() {

  buttonState = digitalRead(buttonPin);
  xVal = analogRead(xPin);
  yVal = analogRead(yPin);
  joySwitchVal = digitalRead(joySwitch);
  switchVal = digitalRead(switchPin);
  //Serial.println(xVal);
 // Serial.println(yVal);
  //Serial.println(joySwitchVal);

  // We display our data separated by a comma  
  Serial.print(xVal,DEC);
  Serial.print(",");
  Serial.print(yVal,DEC);
  Serial.print(",");
  Serial.print(switchVal, DEC);
  Serial.print(",");
  
  Serial.print(buttonState, DEC);

  // compare the buttonState to its previous state
  /*if (buttonState != lastButtonState) {
   // Serial.print("hurr");
    // if the state has changed, increment the counter
    if (buttonState == LOW) {
      // if the current state is HIGH then the button went from off to on:
      buttonPushCounter++;
      Serial.print(thingOn, DEC);
      //Serial.print("\n");
    } else {
      // if the current state is LOW then the button went from on to off:
      //Serial.println("off");
      Serial.print(thingOff, DEC);
      //Serial.print("Hurr");
    } 
   }
   else 
   {
    Serial.print(thingOff, DEC); 
   } 
   */

  //Serial.print(buttonState);

  // We end with a newline character to facilitate subsequent analysis  
  Serial.print("\n");
    //Serial.println(buttonState);
 // lastButtonState = buttonState;
  
}
