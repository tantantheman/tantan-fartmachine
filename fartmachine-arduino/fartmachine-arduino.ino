#include <SimpleMessageSystem.h>

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

int buttonPushCounter = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button

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
  buttonState = digitalRead(buttonPin);
  
  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == LOW) {
      // if the current state is HIGH then the button went from off to on:
      buttonPushCounter++;
      Serial.print("on");
      Serial.print("\n");
     // Serial.print("number of button pushes: ");
      //Serial.println(buttonPushCounter);
    } else {
      // if the current state is LOW then the button went from on to off:
      //Serial.println("off");
    } 
        delay(50);

    }

      lastButtonState = buttonState;
 
  xVal = analogRead(xPin);
  yVal = analogRead(yPin);
  joySwitchVal = digitalRead(joySwitch);
  //Serial.println(xVal);
 // Serial.println(yVal);
  //Serial.println(joySwitchVal);

  // We display our data separated by a comma  
  Serial.print(xVal,DEC);
  Serial.print(",");
  Serial.print(yVal,DEC);
  Serial.print(",");
/*
  // compare the buttonState to its previous state
  if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == LOW) {
      // if the current state is HIGH then the button went from off to on:
      buttonPushCounter++;
      Serial.print("on");
      //Serial.print("\n");
    } else {
      // if the current state is LOW then the button went from on to off:
      //Serial.println("off");
      Serial.print("off");
    } 
        //delay(50);

    }*/

  Serial.print(buttonState);

  // We end with a newline character to facilitate subsequent analysis  
  Serial.print("\n");

  
}
