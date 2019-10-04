# tantan-fartmachine

Introducing: The Fart-O-Matic.

A performable fart machine for class. Module 2, Task 2 (Performance Device).

Programming in both Processing and Arduino IDE.  
  
**Dependencies:** 
Processing.serial  
ddf.minim

**How to run:**  
Open fartmachine_final/fartmachine_final.pde and run on Raspberry Pi. Connected to the RPi should be an ESP32 microcontroller as well as a button, joystick, and toggle switch. The button and switch are connected to an external breadboard, while the joystick is connected directly into the ESP32. 

**How to Operate Device:**  
The buttom-right corner of the top of the box is the button, which produces the fart sound on demand. The switch in the front vertical panel allows you to toggle between two fart noises. The joystick on the right vertical panel allows you to modify two properties of the sound. The y-axis allows for modification of the pitch in real-time, while the x-axis allows for modification of the gain (volume) of the sound in real time. A clever combination of movements in both axis will yield some very unique results, and each time is never the same! 

The audio is output through the Raspberry Pi's 3.5mm analog audio jack. As a result, you will need both a power cable to power the Pi and its connected components, as well as a 3.5mm cable to connect to speakers or a pair of headphones. This was implemented this way so that the Fart-O-Matic could potentially be plugged into large speaker systems for all the more mischevious and immature fun.

**Implementation:**  
To achieve the cohesive performance device, the ESP32 translates the analog signal of the joystick and the digital signals of the switch and button to the Raspberry Pi, allowing for the Processing platform to get precise values for our sonification. 

Essentially, the device is a sound modulator, as the fart noises may be replaced with other sources of audio, and the machine can adjust the gain and pitch of the sound as well. We use the minim library for Processing, which allows for real-time sound modification and playback controls. 

The enclosure was built for maximum repairability and accessibility. The top of the enclosure is on a hinge, which allows for immediate access to all the components in use. The top of the box also rests on the button, which was hot-glued onto a bracket so that the top of the box functions as a larger, clickable surface much like a drum pad. The components are all located on the right side of the box, meant to be playable with one hand. 

**Technical Difficulties:**  
There were several difficulties faced during the build process, as the combination of both hardware and software meant that there were a lot of possibilities of things going wrong.  

Switch and button bouncing was a serious issue, as the code relied on having a stable digital read for those components. Any bouncing would trigger events that were only supposed to happen upon a physical click of a button or toggle of a switch. However, those were solved through activating internal pullup resistors through the Arduino IDE. 

The second big technical difficulty was on the Processing side. In order to accomplish real time pitch and gain modulation, you had to correctly implement the minim library's music player as a continuous output, rather than just a file that is to be played. This allows for a constant pass of information that can be modulated with the joystick. 