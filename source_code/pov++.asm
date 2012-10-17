
_main:

;pov++.c,158 :: 		void main() {
;pov++.c,167 :: 		OSCCON.IDLEN = 0 ;
	BCF         OSCCON+0, 7 
;pov++.c,174 :: 		OSCCON.IRCF2 = 1 ;
	BSF         OSCCON+0, 6 
;pov++.c,175 :: 		OSCCON.IRCF1 = 1 ;
	BSF         OSCCON+0, 5 
;pov++.c,176 :: 		OSCCON.IRCF0 = 1 ;
	BSF         OSCCON+0, 4 
;pov++.c,187 :: 		OSCTUNE.PLLEN = 1 ;
	BSF         OSCTUNE+0, 6 
;pov++.c,193 :: 		TRISA = 0x00;                                  // set direction to be output
	CLRF        TRISA+0 
;pov++.c,194 :: 		PORTA = 0x00;                                  // turn OFF the PORTD leds
	CLRF        PORTA+0 
;pov++.c,196 :: 		while (1) {
L_main0:
;pov++.c,202 :: 		for (repeat=0;repeat<24;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main2:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main267
	MOVLW       24
	SUBWF       main_repeat_L0+0, 0 
L__main267:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;pov++.c,205 :: 		for(n=0;n<6;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main5:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main268
	MOVLW       6
	SUBWF       main_n_L0+0, 0 
L__main268:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;pov++.c,207 :: 		digit_counter = 0;
	CLRF        _digit_counter+0 
	CLRF        _digit_counter+1 
;pov++.c,208 :: 		printChar('A');
	MOVLW       65
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,209 :: 		printChar('N');
	MOVLW       78
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,210 :: 		printChar('D');
	MOVLW       68
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,211 :: 		printChar('R');
	MOVLW       82
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,212 :: 		printChar('E');
	MOVLW       69
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,213 :: 		printChar('W');
	MOVLW       87
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,214 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,215 :: 		printChar('\t');
	MOVLW       9
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,218 :: 		if(digit_counter<10)  {
	MOVLW       128
	XORWF       _digit_counter+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main269
	MOVLW       10
	SUBWF       _digit_counter+0, 0 
L__main269:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;pov++.c,219 :: 		for (i=digit_counter;i<10;i++){
	MOVF        _digit_counter+0, 0 
	MOVWF       main_i_L0+0 
	MOVF        _digit_counter+1, 0 
	MOVWF       main_i_L0+1 
L_main9:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main270
	MOVLW       10
	SUBWF       main_i_L0+0, 0 
L__main270:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;pov++.c,220 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,219 :: 		for (i=digit_counter;i<10;i++){
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;pov++.c,221 :: 		}
	GOTO        L_main9
L_main10:
;pov++.c,222 :: 		}//end if digit counter
L_main8:
;pov++.c,205 :: 		for(n=0;n<6;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,223 :: 		}//end for n
	GOTO        L_main5
L_main6:
;pov++.c,202 :: 		for (repeat=0;repeat<24;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,224 :: 		} //end for repeat
	GOTO        L_main2
L_main3:
;pov++.c,231 :: 		for (repeat=0;repeat<20;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main12:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main271
	MOVLW       20
	SUBWF       main_repeat_L0+0, 0 
L__main271:
	BTFSC       STATUS+0, 0 
	GOTO        L_main13
;pov++.c,233 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main15:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main272
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main272:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;pov++.c,234 :: 		printIcon(inverted_helical, wide); //print helical pattern double wide
	MOVLW       8
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,233 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,235 :: 		}
	GOTO        L_main15
L_main16:
;pov++.c,231 :: 		for (repeat=0;repeat<20;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,237 :: 		}   //end repeat
	GOTO        L_main12
L_main13:
;pov++.c,242 :: 		for (repeat=0;repeat<20;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main18:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main273
	MOVLW       20
	SUBWF       main_repeat_L0+0, 0 
L__main273:
	BTFSC       STATUS+0, 0 
	GOTO        L_main19
;pov++.c,244 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main21:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main274
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main274:
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;pov++.c,245 :: 		printIcon(helical, wide); //print helical pattern double wide
	MOVLW       7
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,244 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,246 :: 		}
	GOTO        L_main21
L_main22:
;pov++.c,242 :: 		for (repeat=0;repeat<20;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,248 :: 		}   //end repeat
	GOTO        L_main18
L_main19:
;pov++.c,252 :: 		for (repeat=0;repeat<30;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main24:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main275
	MOVLW       30
	SUBWF       main_repeat_L0+0, 0 
L__main275:
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;pov++.c,254 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main27:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main276
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main276:
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
;pov++.c,255 :: 		printIcon(greek, wide); //print greek pattern double wide
	MOVLW       6
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,254 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,256 :: 		}
	GOTO        L_main27
L_main28:
;pov++.c,252 :: 		for (repeat=0;repeat<30;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,258 :: 		}   //end repeat
	GOTO        L_main24
L_main25:
;pov++.c,263 :: 		for (repeat=0;repeat<20;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main30:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main277
	MOVLW       20
	SUBWF       main_repeat_L0+0, 0 
L__main277:
	BTFSC       STATUS+0, 0 
	GOTO        L_main31
;pov++.c,265 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main33:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main278
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main278:
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;pov++.c,266 :: 		printIcon(mountain, wide); //print mountain_ICON shape double wide
	MOVLW       1
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,265 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,267 :: 		}
	GOTO        L_main33
L_main34:
;pov++.c,269 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main36:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main279
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main279:
	BTFSC       STATUS+0, 0 
	GOTO        L_main37
;pov++.c,270 :: 		printIcon(inverted_mountain, wide); //print inverted mountain shape double wide
	MOVLW       2
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,269 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,271 :: 		}
	GOTO        L_main36
L_main37:
;pov++.c,263 :: 		for (repeat=0;repeat<20;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,274 :: 		}   //end repeat
	GOTO        L_main30
L_main31:
;pov++.c,280 :: 		for (repeat=0;repeat<20;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main39:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main280
	MOVLW       20
	SUBWF       main_repeat_L0+0, 0 
L__main280:
	BTFSC       STATUS+0, 0 
	GOTO        L_main40
;pov++.c,281 :: 		for(n=0;n<15;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main42:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main281
	MOVLW       15
	SUBWF       main_n_L0+0, 0 
L__main281:
	BTFSC       STATUS+0, 0 
	GOTO        L_main43
;pov++.c,283 :: 		printIcon(checker, wide); //print checker shape double wide
	MOVLW       3
	MOVWF       FARG_printIcon_icon+0 
	MOVLW       1
	MOVWF       FARG_printIcon_wide+0 
	MOVLW       0
	MOVWF       FARG_printIcon_wide+1 
	CALL        _printIcon+0, 0
;pov++.c,281 :: 		for(n=0;n<15;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,285 :: 		}
	GOTO        L_main42
L_main43:
;pov++.c,280 :: 		for (repeat=0;repeat<20;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,286 :: 		}   //end repeat
	GOTO        L_main39
L_main40:
;pov++.c,296 :: 		for (repeat=0;repeat<24;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main45:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main282
	MOVLW       24
	SUBWF       main_repeat_L0+0, 0 
L__main282:
	BTFSC       STATUS+0, 0 
	GOTO        L_main46
;pov++.c,299 :: 		for(n=0;n<2;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main48:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main283
	MOVLW       2
	SUBWF       main_n_L0+0, 0 
L__main283:
	BTFSC       STATUS+0, 0 
	GOTO        L_main49
;pov++.c,301 :: 		digit_counter = 0;
	CLRF        _digit_counter+0 
	CLRF        _digit_counter+1 
;pov++.c,302 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,303 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,304 :: 		printChar('P');
	MOVLW       80
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,305 :: 		printChar('O');
	MOVLW       79
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,306 :: 		printChar('V');
	MOVLW       86
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,307 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,308 :: 		printChar('D');
	MOVLW       68
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,309 :: 		printChar('I');
	MOVLW       73
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,310 :: 		printChar('S');
	MOVLW       83
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,311 :: 		printChar('P');
	MOVLW       80
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,312 :: 		printChar('L');
	MOVLW       76
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,313 :: 		printChar('A');
	MOVLW       65
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,314 :: 		printChar('Y');
	MOVLW       89
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,315 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,316 :: 		printChar('\t');
	MOVLW       9
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,299 :: 		for(n=0;n<2;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,317 :: 		}//end for n
	GOTO        L_main48
L_main49:
;pov++.c,296 :: 		for (repeat=0;repeat<24;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,318 :: 		} //end for repeat
	GOTO        L_main45
L_main46:
;pov++.c,324 :: 		for (repeat=0;repeat<24;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main51:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main284
	MOVLW       24
	SUBWF       main_repeat_L0+0, 0 
L__main284:
	BTFSC       STATUS+0, 0 
	GOTO        L_main52
;pov++.c,328 :: 		digit_counter = 0;
	CLRF        _digit_counter+0 
	CLRF        _digit_counter+1 
;pov++.c,329 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,330 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,331 :: 		printChar('A');
	MOVLW       65
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,332 :: 		printChar('B');
	MOVLW       66
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,333 :: 		printChar('C');
	MOVLW       67
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,334 :: 		printChar('D');
	MOVLW       68
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,335 :: 		printChar('E');
	MOVLW       69
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,336 :: 		printChar('F');
	MOVLW       70
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,337 :: 		printChar('G');
	MOVLW       71
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,338 :: 		printChar('H');
	MOVLW       72
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,339 :: 		printChar('I');
	MOVLW       73
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,340 :: 		printChar('J');
	MOVLW       74
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,341 :: 		printChar('K');
	MOVLW       75
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,342 :: 		printChar('L');
	MOVLW       76
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,343 :: 		printChar('M');
	MOVLW       77
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,344 :: 		printChar('N');
	MOVLW       78
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,345 :: 		printChar('O');
	MOVLW       79
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,346 :: 		printChar('P');
	MOVLW       80
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,347 :: 		printChar('Q');
	MOVLW       81
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,348 :: 		printChar('R');
	MOVLW       82
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,349 :: 		printChar('S');
	MOVLW       83
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,350 :: 		printChar('T');
	MOVLW       84
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,351 :: 		printChar('U');
	MOVLW       85
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,352 :: 		printChar('V');
	MOVLW       86
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,353 :: 		printChar('W');
	MOVLW       87
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,354 :: 		printChar('X');
	MOVLW       88
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,355 :: 		printChar('Y');
	MOVLW       89
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,356 :: 		printChar('Z');
	MOVLW       90
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,357 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,358 :: 		printChar('\t');
	MOVLW       9
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,359 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,324 :: 		for (repeat=0;repeat<24;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,360 :: 		} //end for repeat
	GOTO        L_main51
L_main52:
;pov++.c,371 :: 		for (repeat=0;repeat<24;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main54:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main285
	MOVLW       24
	SUBWF       main_repeat_L0+0, 0 
L__main285:
	BTFSC       STATUS+0, 0 
	GOTO        L_main55
;pov++.c,375 :: 		digit_counter = 0;
	CLRF        _digit_counter+0 
	CLRF        _digit_counter+1 
;pov++.c,376 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,377 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,378 :: 		printChar('[');
	MOVLW       91
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,379 :: 		printChar('1');
	MOVLW       49
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,380 :: 		printChar('2');
	MOVLW       50
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,381 :: 		printChar('3');
	MOVLW       51
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,382 :: 		printChar('4');
	MOVLW       52
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,383 :: 		printChar('5');
	MOVLW       53
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,384 :: 		printChar('6');
	MOVLW       54
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,385 :: 		printChar('7');
	MOVLW       55
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,386 :: 		printChar('8');
	MOVLW       56
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,387 :: 		printChar('9');
	MOVLW       57
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,388 :: 		printChar('0');
	MOVLW       48
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,389 :: 		printChar(']');
	MOVLW       93
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,390 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,391 :: 		printChar('!');
	MOVLW       33
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,392 :: 		printChar('@');
	MOVLW       64
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,393 :: 		printChar('#');
	MOVLW       35
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,394 :: 		printChar('$');
	MOVLW       36
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,395 :: 		printChar('%');
	MOVLW       37
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,396 :: 		printChar('^');
	MOVLW       94
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,397 :: 		printChar('&');
	MOVLW       38
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,398 :: 		printChar('*');
	MOVLW       42
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,399 :: 		printChar('(');
	MOVLW       40
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,400 :: 		printChar(')');
	MOVLW       41
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,401 :: 		printChar('-');
	MOVLW       45
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,402 :: 		printChar('+');
	MOVLW       43
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,403 :: 		printChar('_');
	MOVLW       95
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,404 :: 		printChar('=');
	MOVLW       61
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,405 :: 		printChar('\t');
	MOVLW       9
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,406 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,371 :: 		for (repeat=0;repeat<24;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,407 :: 		} //end for repeat
	GOTO        L_main54
L_main55:
;pov++.c,413 :: 		for (repeat=0;repeat<24;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main57:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main286
	MOVLW       24
	SUBWF       main_repeat_L0+0, 0 
L__main286:
	BTFSC       STATUS+0, 0 
	GOTO        L_main58
;pov++.c,416 :: 		for(n=0;n<2;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main60:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main287
	MOVLW       2
	SUBWF       main_n_L0+0, 0 
L__main287:
	BTFSC       STATUS+0, 0 
	GOTO        L_main61
;pov++.c,417 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,418 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,419 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,420 :: 		printChar('I');
	MOVLW       73
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,421 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,422 :: 		printChar(174); //heart character is double wide
	MOVLW       174
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,423 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,424 :: 		printChar('P');
	MOVLW       80
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,425 :: 		printChar('I');
	MOVLW       73
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,426 :: 		printChar('C');
	MOVLW       67
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,427 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,428 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,429 :: 		printChar(' ');
	MOVLW       32
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,430 :: 		printChar('\t');
	MOVLW       9
	MOVWF       FARG_printChar_letter+0 
	CALL        _printChar+0, 0
;pov++.c,416 :: 		for(n=0;n<2;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,432 :: 		}//end for n
	GOTO        L_main60
L_main61:
;pov++.c,413 :: 		for (repeat=0;repeat<24;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,433 :: 		} //end for repeat
	GOTO        L_main57
L_main58:
;pov++.c,440 :: 		for (repeat=0;repeat<10;repeat++){
	CLRF        main_repeat_L0+0 
	CLRF        main_repeat_L0+1 
L_main63:
	MOVLW       128
	XORWF       main_repeat_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main288
	MOVLW       10
	SUBWF       main_repeat_L0+0, 0 
L__main288:
	BTFSC       STATUS+0, 0 
	GOTO        L_main64
;pov++.c,441 :: 		for(n=0;n<32;n++){
	CLRF        main_n_L0+0 
	CLRF        main_n_L0+1 
L_main66:
	MOVLW       128
	XORWF       main_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main289
	MOVLW       32
	SUBWF       main_n_L0+0, 0 
L__main289:
	BTFSC       STATUS+0, 0 
	GOTO        L_main67
;pov++.c,442 :: 		PORTA = 15;
	MOVLW       15
	MOVWF       PORTA+0 
;pov++.c,443 :: 		Delay_ms(16);
	MOVLW       167
	MOVWF       R12, 0
	MOVLW       58
	MOVWF       R13, 0
L_main69:
	DECFSZ      R13, 1, 1
	BRA         L_main69
	DECFSZ      R12, 1, 1
	BRA         L_main69
	NOP
;pov++.c,444 :: 		PORTA = 240;
	MOVLW       240
	MOVWF       PORTA+0 
;pov++.c,445 :: 		Delay_ms(16);
	MOVLW       167
	MOVWF       R12, 0
	MOVLW       58
	MOVWF       R13, 0
L_main70:
	DECFSZ      R13, 1, 1
	BRA         L_main70
	DECFSZ      R12, 1, 1
	BRA         L_main70
	NOP
;pov++.c,441 :: 		for(n=0;n<32;n++){
	INFSNZ      main_n_L0+0, 1 
	INCF        main_n_L0+1, 1 
;pov++.c,446 :: 		}
	GOTO        L_main66
L_main67:
;pov++.c,440 :: 		for (repeat=0;repeat<10;repeat++){
	INFSNZ      main_repeat_L0+0, 1 
	INCF        main_repeat_L0+1, 1 
;pov++.c,448 :: 		}  //end repeat
	GOTO        L_main63
L_main64:
;pov++.c,452 :: 		} //end while loop
	GOTO        L_main0
;pov++.c,454 :: 		} //end main
	GOTO        $+0
; end of _main

_printChar:

;pov++.c,463 :: 		void printChar(char letter){
;pov++.c,465 :: 		digit_counter++;
	INFSNZ      _digit_counter+0, 1 
	INCF        _digit_counter+1, 1 
;pov++.c,466 :: 		for(n=0;n<8;n++){
	CLRF        R1 
	CLRF        R2 
L_printChar71:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__printChar290
	MOVLW       8
	SUBWF       R1, 0 
L__printChar290:
	BTFSC       STATUS+0, 0 
	GOTO        L_printChar72
;pov++.c,468 :: 		if(letter == 'A') PORTA = letter_A[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar74
	MOVLW       _letter_A+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_A+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_A+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar75
L_printChar74:
;pov++.c,469 :: 		else if(letter == 'B') PORTA = letter_B[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar76
	MOVLW       _letter_B+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_B+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_B+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar77
L_printChar76:
;pov++.c,470 :: 		else if(letter == 'C') PORTA = letter_C[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar78
	MOVLW       _letter_C+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_C+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_C+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar79
L_printChar78:
;pov++.c,471 :: 		else if(letter == 'D') PORTA = letter_D[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar80
	MOVLW       _letter_D+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_D+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_D+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar81
L_printChar80:
;pov++.c,472 :: 		else if(letter == 'E') PORTA = letter_E[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       69
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar82
	MOVLW       _letter_E+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_E+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_E+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar83
L_printChar82:
;pov++.c,473 :: 		else if(letter == 'F') PORTA = letter_F[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar84
	MOVLW       _letter_F+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_F+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_F+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar85
L_printChar84:
;pov++.c,474 :: 		else if(letter == 'G') PORTA = letter_G[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar86
	MOVLW       _letter_G+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_G+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_G+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar87
L_printChar86:
;pov++.c,475 :: 		else if(letter == 'H') PORTA = letter_H[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       72
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar88
	MOVLW       _letter_H+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_H+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_H+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar89
L_printChar88:
;pov++.c,476 :: 		else if(letter == 'I') PORTA = letter_I[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       73
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar90
	MOVLW       _letter_I+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_I+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_I+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar91
L_printChar90:
;pov++.c,477 :: 		else if(letter == 'J') PORTA = letter_J[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       74
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar92
	MOVLW       _letter_J+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_J+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_J+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar93
L_printChar92:
;pov++.c,478 :: 		else if(letter == 'K') PORTA = letter_K[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar94
	MOVLW       _letter_K+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_K+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_K+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar95
L_printChar94:
;pov++.c,479 :: 		else if(letter == 'L') PORTA = letter_L[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar96
	MOVLW       _letter_L+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_L+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_L+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar97
L_printChar96:
;pov++.c,480 :: 		else if(letter == 'M') PORTA = letter_M[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar98
	MOVLW       _letter_M+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_M+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_M+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar99
L_printChar98:
;pov++.c,481 :: 		else if(letter == 'N') PORTA = letter_N[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       78
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar100
	MOVLW       _letter_N+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_N+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_N+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar101
L_printChar100:
;pov++.c,482 :: 		else if(letter == 'O') PORTA = letter_O[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar102
	MOVLW       _letter_O+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_O+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_O+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar103
L_printChar102:
;pov++.c,483 :: 		else if(letter == 'P') PORTA = letter_P[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       80
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar104
	MOVLW       _letter_P+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_P+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_P+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar105
L_printChar104:
;pov++.c,484 :: 		else if(letter == 'Q') PORTA = letter_Q[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       81
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar106
	MOVLW       _letter_Q+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_Q+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_Q+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar107
L_printChar106:
;pov++.c,485 :: 		else if(letter == 'R') PORTA = letter_R[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar108
	MOVLW       _letter_R+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_R+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_R+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar109
L_printChar108:
;pov++.c,486 :: 		else if(letter == 'S') PORTA = letter_S[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar110
	MOVLW       _letter_S+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_S+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_S+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar111
L_printChar110:
;pov++.c,487 :: 		else if(letter == 'T') PORTA = letter_T[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       84
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar112
	MOVLW       _letter_T+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_T+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_T+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar113
L_printChar112:
;pov++.c,488 :: 		else if(letter == 'U') PORTA = letter_U[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       85
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar114
	MOVLW       _letter_U+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_U+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_U+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar115
L_printChar114:
;pov++.c,489 :: 		else if(letter == 'V') PORTA = letter_V[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar116
	MOVLW       _letter_V+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_V+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_V+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar117
L_printChar116:
;pov++.c,490 :: 		else if(letter == 'W') PORTA = letter_W[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar118
	MOVLW       _letter_W+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_W+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_W+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar119
L_printChar118:
;pov++.c,491 :: 		else if(letter == 'X') PORTA = letter_X[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar120
	MOVLW       _letter_X+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_X+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_X+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar121
L_printChar120:
;pov++.c,492 :: 		else if(letter == 'Y') PORTA = letter_Y[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       89
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar122
	MOVLW       _letter_Y+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_Y+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_Y+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar123
L_printChar122:
;pov++.c,493 :: 		else if(letter == 'Z') PORTA = letter_Z[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       90
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar124
	MOVLW       _letter_Z+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_Z+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_Z+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar125
L_printChar124:
;pov++.c,494 :: 		else if(letter == '0') PORTA = letter_0[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar126
	MOVLW       _letter_0+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_0+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_0+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar127
L_printChar126:
;pov++.c,495 :: 		else if(letter == '1') PORTA = letter_1[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar128
	MOVLW       _letter_1+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_1+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar129
L_printChar128:
;pov++.c,496 :: 		else if(letter == '2') PORTA = letter_2[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar130
	MOVLW       _letter_2+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_2+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_2+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar131
L_printChar130:
;pov++.c,497 :: 		else if(letter == '3') PORTA = letter_3[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar132
	MOVLW       _letter_3+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_3+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_3+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar133
L_printChar132:
;pov++.c,498 :: 		else if(letter == '4') PORTA = letter_4[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar134
	MOVLW       _letter_4+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_4+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_4+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar135
L_printChar134:
;pov++.c,499 :: 		else if(letter == '5') PORTA = letter_5[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar136
	MOVLW       _letter_5+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_5+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_5+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar137
L_printChar136:
;pov++.c,500 :: 		else if(letter == '6') PORTA = letter_6[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar138
	MOVLW       _letter_6+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_6+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_6+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar139
L_printChar138:
;pov++.c,501 :: 		else if(letter == '7') PORTA = letter_7[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar140
	MOVLW       _letter_7+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_7+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_7+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar141
L_printChar140:
;pov++.c,502 :: 		else if(letter == '8') PORTA = letter_8[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       56
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar142
	MOVLW       _letter_8+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_8+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_8+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar143
L_printChar142:
;pov++.c,503 :: 		else if(letter == '9') PORTA = letter_9[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       57
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar144
	MOVLW       _letter_9+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_9+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_9+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar145
L_printChar144:
;pov++.c,504 :: 		else if(letter == '.') PORTA = letter_PERIOD[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       46
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar146
	MOVLW       _letter_PERIOD+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_PERIOD+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_PERIOD+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar147
L_printChar146:
;pov++.c,505 :: 		else if(letter == ',') PORTA = letter_COMMA[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       44
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar148
	MOVLW       _letter_COMMA+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_COMMA+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_COMMA+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar149
L_printChar148:
;pov++.c,506 :: 		else if(letter == 34 ) PORTA = letter_QUOTE[n];  //standard straight quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       34
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar150
	MOVLW       _letter_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar151
L_printChar150:
;pov++.c,507 :: 		else if(letter == 147 ) PORTA = letter_QUOTE[n]; //left quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       147
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar152
	MOVLW       _letter_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar153
L_printChar152:
;pov++.c,508 :: 		else if(letter == 148 ) PORTA = letter_QUOTE[n]; //right quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       148
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar154
	MOVLW       _letter_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar155
L_printChar154:
;pov++.c,509 :: 		else if(letter == 39 ) PORTA = letter_SINGLE_QUOTE[n];  //straight single quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar156
	MOVLW       _letter_SINGLE_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SINGLE_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SINGLE_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar157
L_printChar156:
;pov++.c,510 :: 		else if(letter == 145 ) PORTA = letter_SINGLE_QUOTE[n]; //left single quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       145
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar158
	MOVLW       _letter_SINGLE_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SINGLE_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SINGLE_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar159
L_printChar158:
;pov++.c,511 :: 		else if(letter == 146 ) PORTA = letter_SINGLE_QUOTE[n]; //right single quote
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       146
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar160
	MOVLW       _letter_SINGLE_QUOTE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SINGLE_QUOTE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SINGLE_QUOTE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar161
L_printChar160:
;pov++.c,512 :: 		else if(letter == '?') PORTA = letter_QUESTION[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar162
	MOVLW       _letter_QUESTION+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_QUESTION+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_QUESTION+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar163
L_printChar162:
;pov++.c,513 :: 		else if(letter == '!') PORTA = letter_EXCLAIM[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       33
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar164
	MOVLW       _letter_EXCLAIM+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_EXCLAIM+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_EXCLAIM+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar165
L_printChar164:
;pov++.c,514 :: 		else if(letter == '@') PORTA = letter_AT[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       64
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar166
	MOVLW       _letter_AT+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_AT+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_AT+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar167
L_printChar166:
;pov++.c,515 :: 		else if(letter == '#') PORTA = letter_NUM[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       35
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar168
	MOVLW       _letter_NUM+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_NUM+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_NUM+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar169
L_printChar168:
;pov++.c,516 :: 		else if(letter == '$') PORTA = letter_DOLLAR[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar170
	MOVLW       _letter_DOLLAR+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_DOLLAR+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_DOLLAR+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar171
L_printChar170:
;pov++.c,517 :: 		else if(letter == '%') PORTA = letter_PERCENT[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       37
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar172
	MOVLW       _letter_PERCENT+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_PERCENT+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_PERCENT+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar173
L_printChar172:
;pov++.c,518 :: 		else if(letter == '^') PORTA = letter_CARRAT[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       94
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar174
	MOVLW       _letter_CARRAT+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_CARRAT+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_CARRAT+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar175
L_printChar174:
;pov++.c,519 :: 		else if(letter == '&') PORTA = letter_AMPERSAND[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       38
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar176
	MOVLW       _letter_AMPERSAND+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_AMPERSAND+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_AMPERSAND+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar177
L_printChar176:
;pov++.c,520 :: 		else if(letter == '*') PORTA = letter_ASTERISK[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       42
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar178
	MOVLW       _letter_ASTERISK+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_ASTERISK+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_ASTERISK+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar179
L_printChar178:
;pov++.c,521 :: 		else if(letter == '(') PORTA = letter_LEFT_PAREN[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       40
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar180
	MOVLW       _letter_LEFT_PAREN+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_LEFT_PAREN+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_LEFT_PAREN+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar181
L_printChar180:
;pov++.c,522 :: 		else if(letter == ')') PORTA = letter_RIGHT_PAREN[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       41
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar182
	MOVLW       _letter_RIGHT_PAREN+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_RIGHT_PAREN+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_RIGHT_PAREN+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar183
L_printChar182:
;pov++.c,523 :: 		else if(letter == '-') PORTA = letter_DASH[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       45
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar184
	MOVLW       _letter_DASH+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_DASH+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_DASH+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar185
L_printChar184:
;pov++.c,524 :: 		else if(letter == '_') PORTA = letter_UNDERSCORE[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       95
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar186
	MOVLW       _letter_UNDERSCORE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_UNDERSCORE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_UNDERSCORE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar187
L_printChar186:
;pov++.c,525 :: 		else if(letter == '+') PORTA = letter_PLUS[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       43
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar188
	MOVLW       _letter_PLUS+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_PLUS+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_PLUS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar189
L_printChar188:
;pov++.c,526 :: 		else if(letter == '=') PORTA = letter_EQUALS[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar190
	MOVLW       _letter_EQUALS+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_EQUALS+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_EQUALS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar191
L_printChar190:
;pov++.c,527 :: 		else if(letter == '~') PORTA = letter_TILDE[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       126
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar192
	MOVLW       _letter_TILDE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_TILDE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_TILDE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar193
L_printChar192:
;pov++.c,528 :: 		else if(letter == '`') PORTA = letter_TICK[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       96
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar194
	MOVLW       _letter_TICK+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_TICK+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_TICK+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar195
L_printChar194:
;pov++.c,529 :: 		else if(letter == ':') PORTA = letter_COLON[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       58
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar196
	MOVLW       _letter_COLON+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_COLON+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_COLON+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar197
L_printChar196:
;pov++.c,530 :: 		else if(letter == ';') PORTA = letter_SEMICOLON[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       59
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar198
	MOVLW       _letter_SEMICOLON+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SEMICOLON+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SEMICOLON+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar199
L_printChar198:
;pov++.c,531 :: 		else if(letter == 92 ) PORTA = letter_BACK_SLASH[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       92
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar200
	MOVLW       _letter_BACK_SLASH+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_BACK_SLASH+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_BACK_SLASH+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar201
L_printChar200:
;pov++.c,532 :: 		else if(letter == '/') PORTA = letter_FORWARD_SLASH[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       47
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar202
	MOVLW       _letter_FORWARD_SLASH+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_FORWARD_SLASH+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_FORWARD_SLASH+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar203
L_printChar202:
;pov++.c,533 :: 		else if(letter == '<') PORTA = letter_LEFT_CHEVRON[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar204
	MOVLW       _letter_LEFT_CHEVRON+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_LEFT_CHEVRON+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_LEFT_CHEVRON+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar205
L_printChar204:
;pov++.c,534 :: 		else if(letter == '>') PORTA = letter_RIGHT_CHEVRON[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       62
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar206
	MOVLW       _letter_RIGHT_CHEVRON+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_RIGHT_CHEVRON+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_RIGHT_CHEVRON+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar207
L_printChar206:
;pov++.c,535 :: 		else if(letter ==  9 ) PORTA = letter_TAB[n];    // The tab character makes a solid block.
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar208
	MOVLW       _letter_TAB+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_TAB+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_TAB+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar209
L_printChar208:
;pov++.c,536 :: 		else if(letter == '[' ) PORTA = letter_LEFT_BRACKET[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       91
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar210
	MOVLW       _letter_LEFT_BRACKET+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_LEFT_BRACKET+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_LEFT_BRACKET+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar211
L_printChar210:
;pov++.c,537 :: 		else if(letter == ']' ) PORTA = letter_RIGHT_BRACKET[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       93
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar212
	MOVLW       _letter_RIGHT_BRACKET+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_RIGHT_BRACKET+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_RIGHT_BRACKET+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar213
L_printChar212:
;pov++.c,538 :: 		else if(letter == ' ') PORTA = letter_SPC[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       32
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar214
	MOVLW       _letter_SPC+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SPC+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SPC+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar215
L_printChar214:
;pov++.c,539 :: 		else if(letter == 169) PORTA = letter_SMILIE[n]; // SMILIE WAS PLACED IN THE COPYRIGHT ASCII CHARACTER
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       169
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar216
	MOVLW       _letter_SMILIE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_SMILIE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_SMILIE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar217
L_printChar216:
;pov++.c,540 :: 		else if(letter == 174) PORTA = letter_HEART[n];  // HEART WAS PLACED IN THE REGISTERED TRADEMARK ASCII SYMBOL
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       174
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar218
	MOVLW       _letter_HEART+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_HEART+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_HEART+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar219
L_printChar218:
;pov++.c,541 :: 		else if(letter == '\n') PORTA = letter_newline[n];
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar220
	MOVLW       _letter_newline+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_newline+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_newline+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar221
L_printChar220:
;pov++.c,542 :: 		else if(letter == 162) PORTA = letter_CENTS[n];  //cents symbol
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       162
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar222
	MOVLW       _letter_CENTS+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_CENTS+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_CENTS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar223
L_printChar222:
;pov++.c,543 :: 		else if(letter == 176) PORTA = letter_DEGREE[n]; //degree symbol
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       176
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar224
	MOVLW       _letter_DEGREE+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_DEGREE+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_DEGREE+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar225
L_printChar224:
;pov++.c,544 :: 		else if(letter == 128) PORTA = letter_EURO[n];   //euro symbol
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       128
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar226
	MOVLW       _letter_EURO+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_EURO+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_EURO+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar227
L_printChar226:
;pov++.c,545 :: 		else if(letter == 182) PORTA = letter_PILCROW[n];//pilcrow paragraph symbol
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       182
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar228
	MOVLW       _letter_PILCROW+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_PILCROW+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_PILCROW+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar229
L_printChar228:
;pov++.c,546 :: 		else if(letter == 149) PORTA = letter_BULLET[n]; //bullet character
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       149
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar230
	MOVLW       _letter_BULLET+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_BULLET+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_BULLET+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printChar231
L_printChar230:
;pov++.c,547 :: 		else PORTA = letter_newline[n];  //If an invalid ascii character is selected put an empty box.
	MOVLW       _letter_newline+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_letter_newline+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_letter_newline+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
L_printChar231:
L_printChar229:
L_printChar227:
L_printChar225:
L_printChar223:
L_printChar221:
L_printChar219:
L_printChar217:
L_printChar215:
L_printChar213:
L_printChar211:
L_printChar209:
L_printChar207:
L_printChar205:
L_printChar203:
L_printChar201:
L_printChar199:
L_printChar197:
L_printChar195:
L_printChar193:
L_printChar191:
L_printChar189:
L_printChar187:
L_printChar185:
L_printChar183:
L_printChar181:
L_printChar179:
L_printChar177:
L_printChar175:
L_printChar173:
L_printChar171:
L_printChar169:
L_printChar167:
L_printChar165:
L_printChar163:
L_printChar161:
L_printChar159:
L_printChar157:
L_printChar155:
L_printChar153:
L_printChar151:
L_printChar149:
L_printChar147:
L_printChar145:
L_printChar143:
L_printChar141:
L_printChar139:
L_printChar137:
L_printChar135:
L_printChar133:
L_printChar131:
L_printChar129:
L_printChar127:
L_printChar125:
L_printChar123:
L_printChar121:
L_printChar119:
L_printChar117:
L_printChar115:
L_printChar113:
L_printChar111:
L_printChar109:
L_printChar107:
L_printChar105:
L_printChar103:
L_printChar101:
L_printChar99:
L_printChar97:
L_printChar95:
L_printChar93:
L_printChar91:
L_printChar89:
L_printChar87:
L_printChar85:
L_printChar83:
L_printChar81:
L_printChar79:
L_printChar77:
L_printChar75:
;pov++.c,550 :: 		if (letter == 169) Delay_ms(2);        //letter_SMILIE is printed double wide
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       169
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar232
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_printChar233:
	DECFSZ      R13, 1, 1
	BRA         L_printChar233
	DECFSZ      R12, 1, 1
	BRA         L_printChar233
	NOP
	GOTO        L_printChar234
L_printChar232:
;pov++.c,551 :: 		else if(letter == 174) Delay_ms(2);    // letter_HEART is printed double wide
	MOVF        FARG_printChar_letter+0, 0 
	XORLW       174
	BTFSS       STATUS+0, 2 
	GOTO        L_printChar235
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_printChar236:
	DECFSZ      R13, 1, 1
	BRA         L_printChar236
	DECFSZ      R12, 1, 1
	BRA         L_printChar236
	NOP
	GOTO        L_printChar237
L_printChar235:
;pov++.c,552 :: 		else Delay_ms(1); // 600 positions per rev @ 1 ms per pixel column - adjust this to compensate for rpm differences
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_printChar238:
	DECFSZ      R13, 1, 1
	BRA         L_printChar238
	DECFSZ      R12, 1, 1
	BRA         L_printChar238
	NOP
L_printChar237:
L_printChar234:
;pov++.c,466 :: 		for(n=0;n<8;n++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;pov++.c,554 :: 		}
	GOTO        L_printChar71
L_printChar72:
;pov++.c,556 :: 		PORTA = 0;
	CLRF        PORTA+0 
;pov++.c,557 :: 		Delay_ms(2);  // adjust this to compensate for rpm differences
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_printChar239:
	DECFSZ      R13, 1, 1
	BRA         L_printChar239
	DECFSZ      R12, 1, 1
	BRA         L_printChar239
	NOP
;pov++.c,559 :: 		} //end printChar function
	RETURN      0
; end of _printChar

_printIcon:

;pov++.c,573 :: 		void printIcon(char icon, int wide){
;pov++.c,577 :: 		for(n=0;n<18;n++){
	CLRF        R1 
	CLRF        R2 
L_printIcon240:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__printIcon291
	MOVLW       18
	SUBWF       R1, 0 
L__printIcon291:
	BTFSC       STATUS+0, 0 
	GOTO        L_printIcon241
;pov++.c,579 :: 		if(icon == space) PORTA = icon_SPC[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon243
	MOVLW       _icon_SPC+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_SPC+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_SPC+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon244
L_printIcon243:
;pov++.c,580 :: 		else if(icon == mountain) PORTA = icon_MOUNTAINS[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon245
	MOVLW       _icon_MOUNTAINS+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_MOUNTAINS+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_MOUNTAINS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon246
L_printIcon245:
;pov++.c,581 :: 		else if(icon == inverted_mountain) PORTA = icon_INVERTED_MOUNTAINS[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon247
	MOVLW       _icon_INVERTED_MOUNTAINS+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_INVERTED_MOUNTAINS+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_INVERTED_MOUNTAINS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon248
L_printIcon247:
;pov++.c,582 :: 		else if(icon == checker) PORTA = icon_CHECKER[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon249
	MOVLW       _icon_CHECKER+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_CHECKER+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_CHECKER+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon250
L_printIcon249:
;pov++.c,583 :: 		else if(icon == block) PORTA = icon_BLOCK[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon251
	MOVLW       _icon_BLOCK+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_BLOCK+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_BLOCK+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon252
L_printIcon251:
;pov++.c,584 :: 		else if(icon == smiley) PORTA = icon_SMILEY[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon253
	MOVLW       _icon_SMILEY+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_SMILEY+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_SMILEY+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon254
L_printIcon253:
;pov++.c,585 :: 		else if(icon == greek) PORTA = icon_GREEK[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon255
	MOVLW       _icon_GREEK+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_GREEK+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_GREEK+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon256
L_printIcon255:
;pov++.c,586 :: 		else if(icon == helical) PORTA = icon_HELICAL[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon257
	MOVLW       _icon_HELICAL+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_HELICAL+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_HELICAL+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon258
L_printIcon257:
;pov++.c,587 :: 		else if(icon == inverted_helical) PORTA = icon_INVERTED_HELICAL[n];
	MOVF        FARG_printIcon_icon+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_printIcon259
	MOVLW       _icon_INVERTED_HELICAL+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_INVERTED_HELICAL+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_INVERTED_HELICAL+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
	GOTO        L_printIcon260
L_printIcon259:
;pov++.c,590 :: 		else PORTA = icon_SPC[n];
	MOVLW       _icon_SPC+0
	ADDWF       R1, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_icon_SPC+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_icon_SPC+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R2, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTA+0
L_printIcon260:
L_printIcon258:
L_printIcon256:
L_printIcon254:
L_printIcon252:
L_printIcon250:
L_printIcon248:
L_printIcon246:
L_printIcon244:
;pov++.c,593 :: 		if (wide) Delay_ms(2); // adjust this to compensate for rpm differences
	MOVF        FARG_printIcon_wide+0, 0 
	IORWF       FARG_printIcon_wide+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_printIcon261
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_printIcon262:
	DECFSZ      R13, 1, 1
	BRA         L_printIcon262
	DECFSZ      R12, 1, 1
	BRA         L_printIcon262
	NOP
	GOTO        L_printIcon263
L_printIcon261:
;pov++.c,594 :: 		else Delay_ms(1); // 600 positions per rev @ 1 ms per pixel column - adjust this to compensate for rpm differences
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_printIcon264:
	DECFSZ      R13, 1, 1
	BRA         L_printIcon264
	DECFSZ      R12, 1, 1
	BRA         L_printIcon264
	NOP
L_printIcon263:
;pov++.c,577 :: 		for(n=0;n<18;n++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;pov++.c,596 :: 		}
	GOTO        L_printIcon240
L_printIcon241:
;pov++.c,599 :: 		if (wide) digit_counter += 4;
	MOVF        FARG_printIcon_wide+0, 0 
	IORWF       FARG_printIcon_wide+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_printIcon265
	MOVLW       4
	ADDWF       _digit_counter+0, 1 
	MOVLW       0
	ADDWFC      _digit_counter+1, 1 
	GOTO        L_printIcon266
L_printIcon265:
;pov++.c,600 :: 		else digit_counter += 2;
	MOVLW       2
	ADDWF       _digit_counter+0, 1 
	MOVLW       0
	ADDWFC      _digit_counter+1, 1 
L_printIcon266:
;pov++.c,602 :: 		} //end printIcon function
	RETURN      0
; end of _printIcon
