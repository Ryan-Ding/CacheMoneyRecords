ORIGIN 0
SEGMENT CodeSegment1:

START:
    LEA R0, DataSegment

    ADD R1, R1, 12
    ADD R1, R1, -5
    ADD R3, R3, 1
T1:
    ADD R1, R1, 9
    BRn T1   ;not taken
    ADD R4, R4, 1
	BRz T1
T2:
	ADD R4, R4, 1
	ADD R1, R1, -2
	BRp T2 ;taken
	
	LEA R1, jmptest
	JMP R1 ;taken
T3:
	AND R4, R4, 0
	LDR R4, R0, GOOD
	ADD R5, R5, 5
	LEA R5, HOPE
	JSR jsrtest
	
	LEA R2, jsrtest
	JSRR R2
	AND R4, R4, 0
	
    TRAP FUN
T4:
	ADD R4, R4, 1
	LEA R5, RESET
	JMP R5
T5:
	LEA R6, jsrset
	JSRR R6
	
finish:
	BRnzp finish
	
	
	
jmptest:
	LDR R5, R0, GOOD
	ADD R4, R4, 1
	BRp T3

jsrtest:
	LDR R5, R0, GOOD
	ADD R4, R4, 1
	RET

jsrset:
    LDR R1,R0, GOOD
    LDR R2,R0, GOOD
    LDR R3,R0, GOOD
    LDR R4,R0, GOOD
    LDR R5,R0, GOOD
    LDR R6,R0, GOOD
    RET
	




SEGMENT DataSegment:

ZERO:   DATA2 4x0000
ZOOP :  DATA2 4x700F
BEAD :  DATA2 4xBEAD
FUN :   DATA2 HOPE
DEEB:   DATA2 4xDEEB
LEAF:   DATA2 4x1EAF
D22D:   DATA2 4xD22D
LIFE:   DATA2 4x0042
FOED:   DATA2 4xF0ED
BOMB:   DATA2 4xB006
GOOF:   DATA2 4x600F
dunk:   DATA2 4xdddd
RESULT: DATA2 4x0000
GOOD:   DATA2 4x600D
COOKIE: DATA2 4xD0CA
FOOB:   DATA2 4xF00B
aacus:  DATA2 4xFFFF

joiner: DATA2 4x1010
calcx:  DATA2 4x1234
fivespd:DATA2 4x8921
duh:    DATA2 4x9999
chew:   DATA2 4xcccc
crumb:  DATA2 4x6969
GAME:   DATA2 4xba11

SPOT1:  DATA2 4x8888
SPOT2:  DATA2 4xABCD
SPOT3:  DATA2 4x0110
SPOT4:  DATA2 4xABBA

TEST:   DATA2 GAME
DONE:   DATA2 RESULT
MUDPIE: DATA2 4x0000

RESET:
    LDR R1,R0, ZERO
    LDR R2,R0, ZERO
    LDR R3,R0, ZERO
    LDR R4,R0, ZERO
    LDR R5,R0, ZERO
    LDR R6,R0, ZERO
    BRnzp T5

MUDDLER:

    LDR R5, R0, LIFE
    RET

HOPE:
    LDR R1,R0, GOOD
    LDR R2,R0, GOOD
    LDR R3,R0, GOOD
    LDR R4,R0, GOOD
    LDR R5,R0, GOOD
    LDR R6,R0, GOOD
    BRnzp T4

