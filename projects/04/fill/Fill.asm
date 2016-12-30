// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@i
M=0
@COLOR
M=0
@8192
D=A
@MAX
M=D

(LOOP)
@KBD
D=M
@BLACK
D;JGT
@WHITE
0;JMP

(BLACK)
@COLOR
M=-1
@FILL
0;JMP

(WHITE)
@COLOR
M=0
@FILL
0;JMP

(FILL)
// load screen address, set to black
@i
D=M
@SCREEN
D=A+D
@R5
M=D
@COLOR
D=M
@R5
A=M
M=D

//increment i
@i
MD=M+1

//check counter
@MAX
D=M-D
@FILL
D;JGT

@i
M=0
@LOOP
0;JMP
