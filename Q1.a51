org 0000h
MOV R3,#00H	
ljmp main
ORG 000BH
LJMP TOGGLE

	



main:
ACALL lcd_init

MOV P1,#0FFH
CPL P1.7
CPL P1.6
CPL P1.5
CPL P1.4

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string1  ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string2
	  acall lcd_sendstring

MOV R1,#02  /// FOR 2 SECONDS DELAY
ACALL DELAY1
SETB P1.4
MOV TMOD,#01H // timer start
MOV TL0,#00H
MOV TH0,#00H
MOV IE,#82H
SETB TR0
THERE: CJNE R6,#01,THERE
 
 
 
MOV A,TL0
MOV R2,A
ACALL CONVERTER
MOV 65H,61H
MOV 64H,60H
MOV A,TH0
MOV R2,A
ACALL CONVERTER
MOV 63H,61H
MOV 62H,60H
MOV A,R3
MOV R2,A
ACALL CONVERTER

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string3   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string4
	  acall lcd_sendstring
	  

acall delay
acall delay
mov a,#0C9H;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
mov a,60h             ;input 1 higher
acall lcd_senddata

mov a,#0CAh		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,61h             ;input 1 higher
acall lcd_senddata

mov a,#0CBh		  ;Put cursor on second row,3 column
	  acall delay
	  acall delay
	  acall lcd_command
	  acall delay
mov a,62h             ;input 1 higher
acall lcd_senddata

mov a,#0CCH		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,63H             ;input 1 higher
acall lcd_senddata 
mov a,#0CDH		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,64H             ;input 1 higher
acall lcd_senddata 
mov a,#0CEH		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,65H             ;input 1 higher
acall lcd_senddata 

MOV R1,#05
ACALL DELAY1
MOV R6,#00
LJMP MAIN











LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable

;ljump start

org 200h
	  


;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en   

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs       ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine

;----------------------delay routine-----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret

;------------- ROM text strings---------------------------------------------------------------
org 300h
my_string1:
         DB   "TOGGLE SW1",00H
my_string2:
         DB   "IF LED GLOWS ", 00H
my_string3:
         DB   "REACTION TIME",00H
my_string4:
         DB   "COUNT IS       ", 00H
			 		 
			 
			 
			 
DELAY1:
mov r0,#30
ACALL onesecond
djnz r1,DELAY1
RET


onesecond:
ACALL LOOP
DJNZ R0,onesecond
RET
 

LOOP:
MOV TMOD,#00010000B
MOV TL1,#00H
MOV TH1,#00H
SETB TR1
AGAIN: JNB TF1, AGAIN
CLR TR1
CLR TF1

RET

CONVERTER:
;HEXADECIMAL TO ASCII NUMBER CONVERTER SUBROUTINE		
jain : 
MOV 40H,r2
MOV A,40H
ANL A,#0FH
MOV R1,A
SUBB A,#0AH
LCALL ASSCI
MOV 61H,R2 ;value of lsd store
MOV A,40H
SWAP A
ANL A,#0FH
MOV R1,A
SUBB A,#0AH
LCALL ASSCI
MOV 60H,R2 // msd store
RET

ASSCI:

MOV A,R1
JC NEXT
ADD A,#07H
NEXT: ADD A,#30H
MOV R2,A
RET

ORG 1000H
TOGGLE:
MOV A,P1
ANL A,#0FH
CJNE A,#01H,AGAIN1
CPL P1.4
//MOV P1,#00000001B
MOV R6,#01 // VALUE RETURN
CLR TR0
RETI
AGAIN1: INC R3
CLR TF0
CLR TR0
MOV TMOD,#01H // AGAIN START THE TIMER
MOV TH0,#00H
MOV TL0,#00H
SETB TR0

RETI	
END
	
