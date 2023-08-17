ORG 0000H
MAIN:


ACALL lcd_init

MOV 70H,#0F3H
MOV 71H,#0B1H
MOV A,70H
ANL A,#0FH
SWAP A
ACALL LEVEL1
MOV A,70H
ANL A,#0F0H
ACALL level2
mov a,71h
anl a,#0fh
swap a
acall level3
mov a,71h
anl a,#0f0h
acall level4
sjmp main


LEVEL1:

MOV P1,A
acall binary
mov r2,72h
acall CONVERTER
MOV 63H,61H // ASSCI VALUE STORE OF LAST TWO DIGITS IN 62H 63H
MOV 62H,60H
MOV R2,73H
ACALL CONVERTER // NOW FOR THIS THE MOST TWO DIGIT STORE IN 60H 61H

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#85h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string2
	  acall lcd_sendstring
	  

acall delay
acall delay
mov a,#0C6H;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
mov a,60h             ;input 1 higher
acall lcd_senddata

mov a,#0C7h		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,61h             ;input 1 higher
acall lcd_senddata

mov a,#0C8h		  ;Put cursor on second row,3 column
	  acall delay
	  acall delay
	  acall lcd_command
	  acall delay
mov a,62h             ;input 1 higher
acall lcd_senddata

mov a,#0C9H		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,63H             ;input 1 higher
acall lcd_senddata 


MOV R0,#31
ACALL onesecond
ret

level2:
MOV P1,A
acall binary
mov r2,72h
acall CONVERTER
MOV 63H,61H // ASSCI VALUE STORE OF LAST TWO DIGITS IN 62H 63H
MOV 62H,60H
MOV R2,73H
ACALL CONVERTER // NOW FOR THIS THE MOST TWO DIGIT STORE IN 60H 61H

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#85h		 ;Put cursor on first row,5 column
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
mov a,#0C6H;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
mov a,60h             ;input 1 higher
acall lcd_senddata

mov a,#0C7h		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,61h             ;input 1 higher
acall lcd_senddata

mov a,#0C8h		  ;Put cursor on second row,3 column
	  acall delay
	  acall delay
	  acall lcd_command
	  acall delay
mov a,62h             ;input 1 higher
acall lcd_senddata

mov a,#0C9H		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,63H             ;input 1 higher
acall lcd_senddata 


MOV R0,#31
ACALL onesecond
ret


level3:
MOV P1,A
acall binary
mov r2,72h
acall CONVERTER
MOV 63H,61H // ASSCI VALUE STORE OF LAST TWO DIGITS IN 62H 63H
MOV 62H,60H
MOV R2,73H
ACALL CONVERTER // NOW FOR THIS THE MOST TWO DIGIT STORE IN 60H 61H

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#85h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string5  ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string6
	  acall lcd_sendstring
	  

acall delay
acall delay
mov a,#0C6H;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
mov a,60h             ;input 1 higher
acall lcd_senddata

mov a,#0C7h		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,61h             ;input 1 higher
acall lcd_senddata

mov a,#0C8h		  ;Put cursor on second row,3 column
	  acall delay
	  acall delay
	  acall lcd_command
	  acall delay
mov a,62h             ;input 1 higher
acall lcd_senddata

mov a,#0C9H		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,63H             ;input 1 higher
acall lcd_senddata 


MOV R0,#31
ACALL onesecond
ret



level4:
MOV P1,A
acall binary
mov r2,72h
acall CONVERTER
MOV 63H,61H // ASSCI VALUE STORE OF LAST TWO DIGITS IN 62H 63H
MOV 62H,60H
MOV R2,73H
ACALL CONVERTER // NOW FOR THIS THE MOST TWO DIGIT STORE IN 60H 61H

acall delay    /// CALL FOR LCD VALUE PRINTS
	  acall delay
	  acall delay
	  mov a,#85h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov   dptr,#my_string7  ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	  mov a,#0C0h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov   dptr,#my_string8
	  acall lcd_sendstring
	  

acall delay
acall delay
mov a,#0C6H;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
mov a,60h             ;input 1 higher
acall lcd_senddata

mov a,#0C7h		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,61h             ;input 1 higher
acall lcd_senddata

mov a,#0C8h		  ;Put cursor on second row,3 column
	  acall delay
	  acall delay
	  acall lcd_command
	  acall delay
mov a,62h             ;input 1 higher
acall lcd_senddata

mov a,#0C9H		  ;Put cursor on second row,3 column
acall delay
acall delay
acall lcd_command
	  acall delay
mov a,63H             ;input 1 higher
acall lcd_senddata 


MOV R0,#31
ACALL onesecond
ret





onesecond:
ACALL LOOP
DJNZ R0,onesecond
RET
 

LOOP:
MOV TMOD,#01h
MOV TL0,#00H
MOV TH0,#00H
SETB TR0

AGAIN: JNB TF0, AGAIN
CLR TR0
CLR TF0

CLR TR0
CLR TF0
RET


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
         DB   "Level 1",00H
my_string2:
         DB   "value:    ", 00H
my_string3:
         DB   "Level 2", 00H
my_string4:
         DB   "value:    ", 00H

my_string5:
         DB  "Level 3", 00H
my_string6:
         DB  "value:    ", 00H		 
my_string7:
         DB  "level 4", 00H	
my_string8:
         DB  "value:    ", 00H	
			 
binary: ////hexadecimal to binary converter
mov a,P1
swap a
mov b,#02h
div ab
mov r3,b
mov b,#02h
div ab
mov r4,b
mov b,#02h
div ab
mov r5,b
mov b,#02h
div ab
mov r6,b
mov a,r4
swap a
add a,r3
mov 72h,a // the number converted into binary last two bit store in 76h memory location
mov a,r6
swap a
add a,r5
mov 73h,a // the number converted into binary most two significant digit store in 77h memory location
ret			 


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




			 			 
