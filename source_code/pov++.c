/*
 * Project name:
 POV++
 
 * Copyright:
 (c) Andrew Hazelden, 2010.
 
 * Email:
 andrewhazelden@gmail.com
 
 * Blog:
 http://www.andrewhazelden.com
 
 * Project Webpage:
 http://www.andrewhazelden.com/blog/2010/11/digital-poi-spinning-persistence-of-vision-display/
 
 * Revision History:
 Nov 7, 2010 First version
 Dec 6, 2010 Prepared for first public release
 
 * Description:
 This is the POV++ ( persistence of vision) display source code
 
 8 LEDs are connected to PORTA of the PIC Microcontroller.
 
 The rotational resolution of the display is based upon a 24 inch long cord.
 
 There are only uppercase characters in the premade character set. 
 Lowercase characters won't be displayed.
 
 * PIC resources required:
 11 bytes of RAM are used
 6107 bytes of ROM are used
 

 * Test configuration:
 Compiler: MikroC Pro for PIC v4.15.0.0
  
 MCU: PIC18F2685
 INT RC - Internal Oscillator - 32 MHz
 MCLR Disabled


 
 */

char counter;
int digit_counter=0;

//8 pixels high x 7 pixels wide letters
const char letter_SPC[8]= {0,0,0,0,0,0,0};
const char letter_newline[8]= {0,0,0,0,0,0,0};
const char letter_A[8]= {31,36,68,132,68,36,31};
const char letter_B[8]= {255,137,137,137,137,137,118};
const char letter_C[8]= {126,129,129,129,129,129,66};
const char letter_D[8]= {255,129,129,129,129,70,60};
const char letter_E[8]= {255,137,137,137,129,129,129};
const char letter_F[8]= {255,136,136,136,136,128,128};
const char letter_G[8]= {126,129,129,137,137,143,72};
const char letter_H[8]= {255,8,8,8,8,8,255};
const char letter_I[8]= {129,129,129,255,129,129,129};
const char letter_J[8]= {142,129,129,254,128,128,128};
const char letter_K[8]= {255,16,16,16,40,68,131};
const char letter_L[8]= {255,1,1,1,1,1,1};
const char letter_M[8]= {255,128,128,112,128,128,255};
const char letter_N[8]= {255,64,32,16,8,4,255};
const char letter_O[8]= {126,129,129,129,129,129,126};
const char letter_P[8]= {255,136,136,136,136,136,112};
const char letter_Q[8]= {124,130,138,134,131,130,124};
const char letter_R[8]= {255,136,136,136,140,138,113};
const char letter_S[8]= {98,145,145,145,137,137,70};
const char letter_T[8]= {128,128,128,255,128,128,128};
const char letter_U[8]= {255,1,1,1,1,1,255};
const char letter_V[8]= {248,4,2,1,2,4,248};
const char letter_W[8]= {254,1,1,14,1,1,254};
const char letter_X[8]= {129,2,36,24,36,66,129};
const char letter_Y[8]= {128,0,32,31,32,64,128};
const char letter_Z[8]= {131,133,137,145,161,193,129};
const char letter_0[8]= {0,126,133,137,145,161,126};
const char letter_1[8]= {0,33,65,255,1,1,0};
const char letter_2[8]= {65,131,133,137,137,145,99};
const char letter_3[8]= {66,129,129,137,137,149,98};
const char letter_4[8]= {0,12,20,36,68,255,4};
const char letter_5[8]= {121,137,137,137,137,137,134};
const char letter_6[8]= {126,137,137,137,137,137,134};
const char letter_7[8]= {128,128,128,143,144,160,192};
const char letter_8[8]= {118,137,137,129,137,137,118};
const char letter_9[8]= {112,137,137,129,137,137,126};
const char letter_PERIOD[8]= {0,0,0,15,7,0,0};
const char letter_COMMA[8]= {0,0,0,6,7,0,0};
const char letter_QUOTE[8]= {0,120,120,0,120,120,0};
const char letter_SINGLE_QUOTE[8]= {0,0,0,120,120,0,0};
const char letter_QUESTION[8]= {0,96,128,141,144,144,96};
const char letter_EXCLAIM[8]= {0,0,0,253,0,0,0};
const char letter_AT[8]= {0,126,153,165,165,153,120};
const char letter_NUM[8]= {36,255,36,36,36,255,36};
const char letter_DOLLAR[8]= {36,82,82,255,74,74,36};
const char letter_PERCENT[8]= {65,162,68,24,34,69,130};
const char letter_CARRAT[8]= {12,48,64,128,64,48,12};
const char letter_AMPERSAND[8]= {67,163,149,137,141,147,114};
const char letter_ASTERISK[8]= {201,42,28,255,28,42,201};
const char letter_LEFT_PAREN[8]= {0,0,0,126,129,0,0};
const char letter_RIGHT_PAREN[8]= {0,0,129,126,0,0,0};
const char letter_DASH[8]= {8,8,8,8,8,8,8};
const char letter_UNDERSCORE[8]= {1,1,1,1,1,1,1};
const char letter_PLUS[8]= {8,8,8,255,8,8,8};
const char letter_EQUALS[8]= {36,36,36,36,36,36,36};
const char letter_TILDE[8]= {16,48,32,32,16,48,32};
const char letter_TICK[8]= {0,0,96,112,0,0,0};
const char letter_COLON[8]= {0,0,102,102,0,0,0};
const char letter_SEMICOLON[8]= {0,0,102,103,0,0,0};
const char letter_BACK_SLASH[8]= {1,2,4,24,32,64,128};
const char letter_FORWARD_SLASH[8]= {128,64,32,24,4,2,1};
const char letter_LEFT_CHEVRON[8]= {0,36,66,129,0,0,0};
const char letter_RIGHT_CHEVRON[8]= {0,129,66,38,24,24,0};
const char letter_TAB[8]= { 255,255,255,255,255,255,255};  // The tab character makes a solid block.
const char letter_LEFT_BRACKET[8]= {0,0,0,255,129,129,0};
const char letter_RIGHT_BRACKET[8]= {0,129,129,255,0,0,0};
const char letter_SMILIE[8]= {126,137,165,133,165,137,126};  
const char letter_HEART[8]= {120,252,126,63,126,252,120};    
const char letter_DEGREE[8] = {0,48,72,64,48,0,0};          
const char letter_CENTS[8] = {0,60,66,255,66,36,0};          
const char letter_EURO[8] = {20,126,149,149,129,66,0};       
const char letter_PILCROW[8] = {0,48,120,255,128,255,0};     
const char letter_BULLET[8] = {0,60,126,126,126,60,0};       

//8x18 icons
const char icon_SPC[19]= {255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255};       //blank icon
const char icon_MOUNTAINS[19]= {1,1,3,7,15,31,63,127,255,255,127,63,31,15,7,3,1,1}; //mountain range icon
const char icon_INVERTED_MOUNTAINS[19]= {254,254,252,248,240,224,192,128,0,0,128,192,224,240,248,252,254,254}; //inverted mountains
const char icon_CHECKER[19]= {170,85,170,85,170,85,170,85,170,85,170,85,170,85,170,85,170,85}; // fine checker pattern
const char icon_BLOCK[19]= {0,255,255,195,195,195,195,195,195,195,195,195,195,195,195,255,255,0};     //Hollow block icon
const char icon_SMILEY[19]= {0,0,126,129,129,137,133,165,133,133,133,165,133,137,129,129,126,0};     //smiley icon
const char icon_GREEK[19]= {2,254,128,128,158,146,146,242,2,2,254,128,128,158,146,146,242,2};     //Greek Pattern
const char icon_HELICAL[19]= {195,195,192,224,96,112,56,28,15,199,192,192,192,192,224,104,124,62}; //helical pattern
const char icon_INVERTED_HELICAL[19]= {60,60,63,31,159,143,199,227,241,56,60,63,63,63,31,151,131,193}; // inverted helical pattern





// allows icons to be used with plain english lowercase names
enum  icon_list{ space, mountain, inverted_mountain, checker, block, smiley, greek, helical, inverted_helical};


enum icon_width{ thin, wide };  // thin == 0, wide == 1



//function to print a 8x7 single character
void printChar(char letter);

//function to print an 8x18 icon
void printIcon(char icon, int wide); //0 = thin, 1 = wide



void main() {
        int n, i, repeat;
        
        
        
        // INTOSC configuration ***START***
        //asm{ sleep } command behavior
        //0 to enable sleep mode
        //1 to enable idle mode
        OSCCON.IDLEN = 0 ;
        
        //INTOSC clock speed
        //111 = 8mhz then turn on PLL for 32mhz
        //111 and no PLL = 8mhz
        //100 = 1 mhz
        //000 = 31.25 khz
        OSCCON.IRCF2 = 1 ;
        OSCCON.IRCF1 = 1 ;
        OSCCON.IRCF0 = 1 ;
        
        //select the low speed INTOSC / INTRC clock source
        //only relevant if you want to run at 31 khz and the IRCF0-2 registers = 000
        //1 = 31.25 khz clock derived from INTOSC
        //0 = 31.00 khz clock derived from INTRC, maximum power savings, least accurate
        //OSCTUNE.INTSRC = 1 ;
        
        //Used to turn on the PLL function when the INTOSC speed is set to either 4 or 8 mhz
        //0 turns off the PLL
        //1 turns it on, used to get 32 mhz when the IRCF0-2 registers = 111
        OSCTUNE.PLLEN = 1 ;
        
        // INTOSC configuration ***END***
        
        
        
        TRISA = 0x00;                                  // set direction to be output
        PORTA = 0x00;                                  // turn OFF the PORTD leds
        
        while (1) {
                
                
                
                //start word cycle
                // 60 characters per rev @ 60 ms per rotation    / 6 repeats per rev = 10 characters
                for (repeat=0;repeat<24;repeat++){
                        
                        //fill a revolution
                        for(n=0;n<6;n++){
                                //spaces left digit counter
                                digit_counter = 0;
                                printChar('A');
                                printChar('N');
                                printChar('D');
                                printChar('R');
                                printChar('E');
                                printChar('W');
                                printChar(' ');
                                printChar('\t');
                                
                                //pad with spaces if digit counter is below zero
                                if(digit_counter<10)  {
                                        for (i=digit_counter;i<10;i++){
                                                printChar(' ');
                                        }
                                }//end if digit counter
                        }//end for n
                } //end for repeat
                
                //END word cycle
                
                
                
                //wide icon printing (15 wide characters per rev)
                for (repeat=0;repeat<20;repeat++){
                        
                        for(n=0;n<15;n++){
                                printIcon(inverted_helical, wide); //print helical pattern double wide
                        }
                        
                }   //end repeat
                
                
                
                //wide icon printing (15 wide characters per rev)
                for (repeat=0;repeat<20;repeat++){
                        
                        for(n=0;n<15;n++){
                                printIcon(helical, wide); //print helical pattern double wide
                        }
                        
                }   //end repeat
                
                
                //wide icon printing (15 wide characters per rev)
                for (repeat=0;repeat<30;repeat++){
                        
                        for(n=0;n<15;n++){
                                printIcon(greek, wide); //print greek pattern double wide
                        }
                        
                }   //end repeat
                
                
                
                //wide icon printing (15 wide characters per rev)
                for (repeat=0;repeat<20;repeat++){
                        
                        for(n=0;n<15;n++){
                                printIcon(mountain, wide); //print mountain_ICON shape double wide
                        }
                        
                        for(n=0;n<15;n++){
                                printIcon(inverted_mountain, wide); //print inverted mountain shape double wide
                        }
                        
                        
                }   //end repeat
                
                
                
                
                //wide icon printing (15 wide characters per rev)
                for (repeat=0;repeat<20;repeat++){
                        for(n=0;n<15;n++){
                                
                                printIcon(checker, wide); //print checker shape double wide
                                
                        }
                }   //end repeat
                
                
                
                
                
                
                
                //start first word cycle
                // 60 characters per rev @ 60 ms per rotation    / 4 repeats per rev = 15 characters
                for (repeat=0;repeat<24;repeat++){
                        
                        //fill a revolution
                        for(n=0;n<2;n++){
                                //spaces left digit counter
                                digit_counter = 0;
                                printChar(' ');
                                printChar(' ');
                                printChar('P');
                                printChar('O');
                                printChar('V');
                                printChar(' ');
                                printChar('D');
                                printChar('I');
                                printChar('S');
                                printChar('P');
                                printChar('L');
                                printChar('A');
                                printChar('Y');
                                printChar(' ');
                                printChar('\t');
                        }//end for n
                } //end for repeat
                
                //END first word cycle
                
                //start first word cycle
                // 60 characters per rev @ 60 ms per rotation    / 1 repeats per rev = 30 characters
                for (repeat=0;repeat<24;repeat++){
                        
                        //fill a revolution
                        //spaces left digit counter
                        digit_counter = 0;
                        printChar(' ');
                        printChar(' ');
                        printChar('A');
                        printChar('B');
                        printChar('C');
                        printChar('D');
                        printChar('E');
                        printChar('F');
                        printChar('G');
                        printChar('H');
                        printChar('I');
                        printChar('J');
                        printChar('K');
                        printChar('L');
                        printChar('M');
                        printChar('N');
                        printChar('O');
                        printChar('P');
                        printChar('Q');
                        printChar('R');
                        printChar('S');
                        printChar('T');
                        printChar('U');
                        printChar('V');
                        printChar('W');
                        printChar('X');
                        printChar('Y');
                        printChar('Z');
                        printChar(' ');
                        printChar('\t');
                        printChar(' ');
                } //end for repeat
                
                //END first word cycle
                
                
                
                
                
                
                //start first word cycle
                // 60 characters per rev @ 60 ms per rotation    / 1 repeats per rev = 30 characters
                for (repeat=0;repeat<24;repeat++){
                        
                        //fill a revolution
                        //spaces left digit counter
                        digit_counter = 0;
                        printChar(' ');
                        printChar(' ');
                        printChar('[');
                        printChar('1');
                        printChar('2');
                        printChar('3');
                        printChar('4');
                        printChar('5');
                        printChar('6');
                        printChar('7');
                        printChar('8');
                        printChar('9');
                        printChar('0');
                        printChar(']');
                        printChar(' ');
                        printChar('!');
                        printChar('@');
                        printChar('#');
                        printChar('$');
                        printChar('%');
                        printChar('^');
                        printChar('&');
                        printChar('*');
                        printChar('(');
                        printChar(')');
                        printChar('-');
                        printChar('+');
                        printChar('_');
                        printChar('=');
                        printChar('\t');
                        printChar(' ');
                } //end for repeat
                
                //END first word cycle
                
                //start word cycle
                // 60 characters per rev @ 60 ms per rotation    / 2 repeats per rev = 15 characters
                for (repeat=0;repeat<24;repeat++){
                        
                        //fill a revolution
                        for(n=0;n<2;n++){
                                printChar(' ');
                                printChar(' ');
                                printChar(' ');
                                printChar('I');
                                printChar(' ');
                                printChar(174); //heart character is double wide
                                printChar(' ');
                                printChar('P');
                                printChar('I');
                                printChar('C');
                                printChar(' ');
                                printChar(' ');
                                printChar(' ');
                                printChar('\t');
                                
                        }//end for n
                } //end for repeat
                
                //END word cycle
                
                
                
                //checker cube printing
                 for (repeat=0;repeat<10;repeat++){
                 for(n=0;n<32;n++){
                 PORTA = 15;
                 Delay_ms(16);
                 PORTA = 240;
                 Delay_ms(16);
                 }
                 
                 }  //end repeat
                
                
                
        } //end while loop
        
} //end main


// ----------------------------------------------------------
//
// The printChar function prints prints a single 8x7 chracter.
//
// ----------------------------------------------------------

void printChar(char letter){
        int n;
        digit_counter++;
    for(n=0;n<8;n++){
                
                if(letter == 'A') PORTA = letter_A[n];
                else if(letter == 'B') PORTA = letter_B[n];
                else if(letter == 'C') PORTA = letter_C[n];
                else if(letter == 'D') PORTA = letter_D[n];
                else if(letter == 'E') PORTA = letter_E[n];
                else if(letter == 'F') PORTA = letter_F[n];
                else if(letter == 'G') PORTA = letter_G[n];
                else if(letter == 'H') PORTA = letter_H[n];
                else if(letter == 'I') PORTA = letter_I[n];
                else if(letter == 'J') PORTA = letter_J[n];
                else if(letter == 'K') PORTA = letter_K[n];
                else if(letter == 'L') PORTA = letter_L[n];
                else if(letter == 'M') PORTA = letter_M[n];
                else if(letter == 'N') PORTA = letter_N[n];
                else if(letter == 'O') PORTA = letter_O[n];
                else if(letter == 'P') PORTA = letter_P[n];
                else if(letter == 'Q') PORTA = letter_Q[n];
                else if(letter == 'R') PORTA = letter_R[n];
                else if(letter == 'S') PORTA = letter_S[n];
                else if(letter == 'T') PORTA = letter_T[n];
                else if(letter == 'U') PORTA = letter_U[n];
                else if(letter == 'V') PORTA = letter_V[n];
                else if(letter == 'W') PORTA = letter_W[n];
                else if(letter == 'X') PORTA = letter_X[n];
                else if(letter == 'Y') PORTA = letter_Y[n];
                else if(letter == 'Z') PORTA = letter_Z[n];
                else if(letter == '0') PORTA = letter_0[n];
                else if(letter == '1') PORTA = letter_1[n];
                else if(letter == '2') PORTA = letter_2[n];
                else if(letter == '3') PORTA = letter_3[n];
                else if(letter == '4') PORTA = letter_4[n];
                else if(letter == '5') PORTA = letter_5[n];
                else if(letter == '6') PORTA = letter_6[n];
                else if(letter == '7') PORTA = letter_7[n];
                else if(letter == '8') PORTA = letter_8[n];
                else if(letter == '9') PORTA = letter_9[n];
                else if(letter == '.') PORTA = letter_PERIOD[n];
                else if(letter == ',') PORTA = letter_COMMA[n];
                else if(letter == 34 ) PORTA = letter_QUOTE[n];  //standard straight quote
                else if(letter == 147 ) PORTA = letter_QUOTE[n]; //left quote
                else if(letter == 148 ) PORTA = letter_QUOTE[n]; //right quote
                else if(letter == 39 ) PORTA = letter_SINGLE_QUOTE[n];  //straight single quote
                else if(letter == 145 ) PORTA = letter_SINGLE_QUOTE[n]; //left single quote
                else if(letter == 146 ) PORTA = letter_SINGLE_QUOTE[n]; //right single quote
                else if(letter == '?') PORTA = letter_QUESTION[n];
                else if(letter == '!') PORTA = letter_EXCLAIM[n];
                else if(letter == '@') PORTA = letter_AT[n];
                else if(letter == '#') PORTA = letter_NUM[n];
                else if(letter == '$') PORTA = letter_DOLLAR[n];
                else if(letter == '%') PORTA = letter_PERCENT[n];
                else if(letter == '^') PORTA = letter_CARRAT[n];
                else if(letter == '&') PORTA = letter_AMPERSAND[n];
                else if(letter == '*') PORTA = letter_ASTERISK[n];
                else if(letter == '(') PORTA = letter_LEFT_PAREN[n];
                else if(letter == ')') PORTA = letter_RIGHT_PAREN[n];
                else if(letter == '-') PORTA = letter_DASH[n];
                else if(letter == '_') PORTA = letter_UNDERSCORE[n];
                else if(letter == '+') PORTA = letter_PLUS[n];
                else if(letter == '=') PORTA = letter_EQUALS[n];
                else if(letter == '~') PORTA = letter_TILDE[n];
                else if(letter == '`') PORTA = letter_TICK[n];
                else if(letter == ':') PORTA = letter_COLON[n];
                else if(letter == ';') PORTA = letter_SEMICOLON[n];
                else if(letter == 92 ) PORTA = letter_BACK_SLASH[n];
                else if(letter == '/') PORTA = letter_FORWARD_SLASH[n];
                else if(letter == '<') PORTA = letter_LEFT_CHEVRON[n];
                else if(letter == '>') PORTA = letter_RIGHT_CHEVRON[n];
                else if(letter ==  9 ) PORTA = letter_TAB[n];    // The tab character makes a solid block.
                else if(letter == '[' ) PORTA = letter_LEFT_BRACKET[n];
                else if(letter == ']' ) PORTA = letter_RIGHT_BRACKET[n];
                else if(letter == ' ') PORTA = letter_SPC[n];
                else if(letter == 169) PORTA = letter_SMILIE[n]; // SMILIE WAS PLACED IN THE COPYRIGHT ASCII CHARACTER
                else if(letter == 174) PORTA = letter_HEART[n];  // HEART WAS PLACED IN THE REGISTERED TRADEMARK ASCII SYMBOL
                else if(letter == '\n') PORTA = letter_newline[n];
                else if(letter == 162) PORTA = letter_CENTS[n];  //cents symbol
                else if(letter == 176) PORTA = letter_DEGREE[n]; //degree symbol
                else if(letter == 128) PORTA = letter_EURO[n];   //euro symbol
                else if(letter == 182) PORTA = letter_PILCROW[n];//pilcrow paragraph symbol
                else if(letter == 149) PORTA = letter_BULLET[n]; //bullet character
                else PORTA = letter_newline[n];  //If an invalid ascii character is selected put an empty box.
                
                
                if (letter == 169) Delay_ms(2);        //letter_SMILIE is printed double wide
                else if(letter == 174) Delay_ms(2);    // letter_HEART is printed double wide
                else Delay_ms(1); // 600 positions per rev @ 1 ms per pixel column - adjust this to compensate for rpm differences
                
        }
        // 2 empty pixel rows
        PORTA = 0;
        Delay_ms(2);  // adjust this to compensate for rpm differences
        
} //end printChar function





// ----------------------------------------------------------
//
//  The printIcon function prints prints a single 8x18 icon.
//  wide == 1 enables double width icon printing.
//  wide == 0 prints a thin icon.
//
// ----------------------------------------------------------

void printIcon(char icon, int wide){
        int n;
        
        
    for(n=0;n<18;n++){
                
                if(icon == space) PORTA = icon_SPC[n];
                else if(icon == mountain) PORTA = icon_MOUNTAINS[n];
                else if(icon == inverted_mountain) PORTA = icon_INVERTED_MOUNTAINS[n];
                else if(icon == checker) PORTA = icon_CHECKER[n];
                else if(icon == block) PORTA = icon_BLOCK[n];
                else if(icon == smiley) PORTA = icon_SMILEY[n];
                else if(icon == greek) PORTA = icon_GREEK[n];
                else if(icon == helical) PORTA = icon_HELICAL[n];
                else if(icon == inverted_helical) PORTA = icon_INVERTED_HELICAL[n];
                
                
                else PORTA = icon_SPC[n];
                
                //print character double wide if true
                if (wide) Delay_ms(2); // adjust this to compensate for rpm differences
                else Delay_ms(1); // 600 positions per rev @ 1 ms per pixel column - adjust this to compensate for rpm differences
                
        }
        
        //is the digit 2 or 4 characters wide?
        if (wide) digit_counter += 4;  
        else digit_counter += 2;        
        
} //end printIcon function