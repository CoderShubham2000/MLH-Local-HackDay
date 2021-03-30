#include <Servo.h>
#include <OLED_I2C.h>

//define the servos
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

OLED  myOLED(SDA, SCL);
extern uint8_t SmallFont[];

//define the buttons
const int button1 = 12;
const int button2 = 13;

//define variable for values of the button
int button1Pressed = 0;
boolean button2Pressed = false;

//define potentiometers
const int pot1 = A1;
const int pot2 = A2;
const int pot3 = A3;
const int pot4 = A4;

//define variable for values of the potentiometers
int pot1Val;
int pot2Val;
int pot3Val;
int pot4Val;

//define variable for angles of the potentiometer
int pot1Angle;
int pot2Angle;
int pot3Angle;
int pot4Angle;

//define variable for saved position of the servos
int servo1PosSave[]={1,1,1,1,1,1,1,1};
int servo2PosSave[]={1,1,1,1,1,1,1,1};
int servo3PosSave[]={1,1,1,1,1,1,1,1};
int servo4PosSave[]={1,1,1,1,1,1,1,1};

void setup() {

  myOLED.begin();
  myOLED.setFont(SmallFont);
  Serial.begin(9600);
  
  //define attached pins of the servos
  servo1.attach(3);
  servo2.attach(4);
  servo3.attach(5);
  servo4.attach(6);

  //define buttons as input units
  pinMode(button1, INPUT);
  pinMode(button2, INPUT);

  servo1.write(90);
  servo2.write(90);
  servo3.write(90);
  servo4.write(90);

  myOLED.clrScr();
  myOLED.print("Roaring Engineers", CENTER, 8);
  myOLED.print("PRESS TO SAVE BUTTON", CENTER, 42);
  myOLED.update();
  
}

void loop() {
  //read the potentiometer values and define the servo angle to
  //the potentiometer value with the map function
  pot1Val = analogRead(pot1);
  pot1Angle = map (pot1Val, 0, 1023, 10, 179);
  pot2Val = analogRead(pot2);
  pot2Angle = map (pot2Val, 0, 1023, 10, 150);
  pot3Val = analogRead(pot3);
  pot3Angle = map (pot3Val, 0, 1023, 10, 170);
  pot4Val = analogRead(pot4);
  pot4Angle = map (pot4Val, 0, 1023, 10, 170);

  //servos move to mapped angles
  servo1.write(pot1Angle);
  servo2.write(pot2Angle);
  servo3.write(pot3Angle);
  servo4.write(pot4Angle);

  //if button1 is pressed (HIGH), save the potentiometers position
  //as long as button1 is pressed
  if(digitalRead(button1) == HIGH){
    button1Pressed++;
    switch(button1Pressed){
      case 1:
        servo1PosSave[0] = pot1Angle;
        servo2PosSave[0] = pot2Angle;
        servo3PosSave[0] = pot3Angle;
        servo4PosSave[0] = pot4Angle;
        Serial.println("Position #1 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #1 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 2:
        servo1PosSave[1] = pot1Angle;
        servo2PosSave[1] = pot2Angle;
        servo3PosSave[1] = pot3Angle;
        servo4PosSave[1] = pot4Angle;
        Serial.println("Position #2 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #2 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 3:
        servo1PosSave[2] = pot1Angle;
        servo2PosSave[2] = pot2Angle;
        servo3PosSave[2] = pot3Angle;
        servo4PosSave[2] = pot4Angle;
        Serial.println("Position #3 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #3 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 4:
        servo1PosSave[3] = pot1Angle;
        servo2PosSave[3] = pot2Angle;
        servo3PosSave[3] = pot3Angle;
        servo4PosSave[3] = pot4Angle;
        Serial.println("Position #4 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #4 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 5:
        servo1PosSave[4] = pot1Angle;
        servo2PosSave[4] = pot2Angle;
        servo3PosSave[4] = pot3Angle;
        servo4PosSave[4] = pot4Angle;
        Serial.println("Position #5 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #5 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 6:
        servo1PosSave[5] = pot1Angle;
        servo2PosSave[5] = pot2Angle;
        servo3PosSave[5] = pot3Angle;
        servo4PosSave[5] = pot4Angle;
        Serial.println("Position #6 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #6 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 7:
        servo1PosSave[6] = pot1Angle;
        servo2PosSave[6] = pot2Angle;
        servo3PosSave[6] = pot3Angle;
        servo4PosSave[6] = pot4Angle;
        Serial.println("Position #7 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #7 SAVED", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       case 8:
        servo1PosSave[7] = pot1Angle;
        servo2PosSave[7] = pot2Angle;
        servo3PosSave[7] = pot3Angle;
        servo4PosSave[7] = pot4Angle;
        Serial.println("Position #8 Saved");
        myOLED.clrScr();
        myOLED.print("Roaring Engineers", CENTER, 8);
        myOLED.print("POSITION #8 SAVED", CENTER, 28);
        myOLED.print("PRESS TO MOVE BUTTON", CENTER, 42);
        myOLED.update();
        delay(1500);
       break;
       
    }
  }
  //if button2 pressed (HIGH), the servos move saved position
  if(digitalRead(button2) == HIGH){
    button2Pressed = true;
  }
  
  if(button2Pressed){
    for(int i=0; i<8; i++){
      servo1.write(servo1PosSave[i]);
      servo2.write(servo2PosSave[i]);
      servo3.write(servo3PosSave[i]);
      servo4.write(servo4PosSave[i]);
      myOLED.clrScr();
      myOLED.print("Roaring Engineers", CENTER, 8);
      myOLED.print("MOVING...", CENTER, 42);
      myOLED.update();
      delay(2000);
    }
  }
  delay(100);
}
