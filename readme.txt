Andrew Hazelden's Digital Poi Spinning - Persistence of Vision Display
Version 1 - Dec 6, 2010

This is a Digital Poi Spinning display project that uses a Microchip PIC PIC18F2685 microcontroller to draw text and graphics using 8 LEDs. The project was designed to teach basic electronics and microcontroller programming to students and hobbbyists.

You can view a Youtube video of the finished Digital Poi spinning POV display:
http://www.youtube.com/watch?v=YfskAMJwGYE

The MikroC Pro for PIC source code, electronics schematic, and a LED character design .xls Excel spreadsheet are provided.

The steps to connect the board to the computer goes something like this:

  -Convert the provided schematic to a PCB layout.

  -Etch the printed circuit board in your workshop.

  -Assemble the circuit board and solder on components.

  -Use the provided HEX file and either a Microchip PICKIT ICSP programmer or MikroElektronkia MikroProg ICSP programmer to write the firmware to the microcontroller.

  -Update the provided source in MikroC Pro for PIC to display your own text and graphics.

  -Spin the board outdoors or in a dark room to view the display.

I included an Excel spreadsheet that helps create the font character values so you can add your own symbols and shapes to the display.


Notes:
8 LEDs are connected to PORTA of the PIC Microcontroller.

The rotational resolution of the display is based upon a 24 inch long cord.

There are only uppercase characters in the premade character set. 

PIC resources required:
11 bytes of RAM are used
6107 bytes of ROM are used

Compiler: MikroC Pro for PIC

MCU: PIC18F2685
INT RC - Internal Oscillator - 32 MHz
MCLR Disabled


Example Created by Andrew Hazelden. (c) copyright 2010-2012.

Email: andrew@andrewhazelden.com
 
Blog:  http://www.andrewhazelden.com


