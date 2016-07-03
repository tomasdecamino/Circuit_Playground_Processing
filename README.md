# Circuit_Playground_Processing
Code to use Adafruit Circuit Playground with processing via serial transmission of strings

##Arduino code

Folder *playground_serial_send* contains the Arduino code. This code just sends all sensor data using serial comunnication at 9600.

##Basic processing code

The folder *playground_serial_data* caintains the basic processing code.  In processing a comma separated string is received and then separated in sensor data variables. CapSens (array), light, sound, temp, slide, buttoneft and buttonRight.  Simple example of ussage is shown.

1. *playground_serial_accel* is an example where a fractal tree is constructed with varying angles and size, given Circuit Playground accelerometer data.
2. *playground_serial_capsense* uses Processing Sound library to play notes when capacitive sensors are touched.

Contents prepared for teaching pourposes [Fundación Costa Rica para la Innovación](http://funcostarica.org/)
