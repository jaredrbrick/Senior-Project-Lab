;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
; Uses a Potentiometer for fine tuning stations, two pushbuttons for station jumps
; Includes code from ARRL QEX Files
;Written By Jared Brick
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
;Constants Start Here, all Stations needs two values

.text: ;Just park these constants on flash. Who could ever use all 16KB? 
	   ;It's not going anywhere
MSB881		.equ		0100111101000001B
MSB883		.equ  		0100111101110110B
MSB885		.equ  		0100111110101010B
MSB887		.equ  		0100111111011111B
MSB889		.equ  		0101000000010011B
MSB891		.equ  		0101000001001000B
MSB893		.equ  		0101000001111100B
MSB895		.equ  		0101000010110000B
MSB897		.equ  		0101000011100101B
MSB899		.equ  		0101000100011001B
MSB901		.equ  		0101000101001110B
MSB903		.equ  		0101000110000010B
MSB905		.equ  		0101000110110111B
MSB907		.equ  		0101000111101011B
MSB909		.equ  		0101001000011111B
MSB911		.equ  		0101001001010100B
MSB913		.equ  		0101001010001000B
MSB915		.equ  		0101001010111101B
MSB917		.equ  		0101001011110001B
MSB919		.equ  		0101001100100110B
MSB921		.equ  		0101001101011010B
MSB923		.equ  		0101001110001110B
MSB925		.equ  		0101001111000011B
MSB927		.equ  		0101001111110111B
MSB929		.equ  		0101010000101100B
MSB931		.equ  		0101010001100000B
MSB933		.equ  		0101010010010101B
MSB935		.equ  		0101010011001001B
MSB937		.equ  		0101010011111101B
MSB939		.equ  		0101010100110010B
MSB941		.equ  		0101010101100110B
MSB943		.equ  		0101010110011011B
MSB945		.equ  		0101010111001111B
MSB947		.equ  		0101011000000100B
MSB949		.equ  		0101011000111000B
MSB951		.equ  		0101011001101100B
MSB953		.equ  		0101011010100001B
MSB955		.equ  		0101011011010101B
MSB957		.equ  		0101011100001010B
MSB959		.equ  		0101011100111110B
MSB961		.equ  		0101011101110011B
MSB963		.equ  		0101011110100111B
MSB965		.equ  		0101011111011011B
MSB967		.equ  		0101100000010000B
MSB969		.equ  		0101100001000100B
MSB971		.equ  		0101100001111001B
MSB973		.equ  		0101100010101101B
MSB975		.equ  		0101100011100010B
MSB977		.equ  		0101100100010110B
MSB979		.equ  		0101100101001010B
MSB981		.equ  		0101100101111111B
MSB983		.equ  		0101100110110011B
MSB985		.equ  		0101100111101000B
MSB987		.equ  		0101101000011100B
MSB989		.equ  		0101101001010001B
MSB991		.equ  		0101101010000101B
MSB993		.equ  		0101101010111001B
MSB995		.equ  		0101101011101110B
MSB997		.equ  		0101101100100010B
MSB999		.equ  		0101101101010111B
MSB1001		.equ  		0101101110001011B
MSB1003		.equ  		0101101111000000B
MSB1005		.equ  		0101101111110100B
MSB1007		.equ  		0101110000101000B
MSB1009		.equ  		0101110001011101B
MSB1011		.equ  		0101110010010001B
MSB1013		.equ  		0101110011000110B
MSB1015		.equ  		0101110011111010B
MSB1017		.equ  		0101110100101111B
MSB1019		.equ  		0101110101100011B
MSB1021		.equ  		0101110110010111B
MSB1023		.equ  		0101110111001100B
MSB1025		.equ  		0101111000000000B
MSB1027		.equ  		0101111000110101B
MSB1029		.equ  		0101111001101001B
MSB1031		.equ  		0101111010011110B
MSB1033		.equ  		0101111011010010B
MSB1035		.equ  		0101111100000110B
MSB1037		.equ  		0101111100111011B
MSB1039		.equ  		0101111101101111B
MSB1041		.equ  		0101111110100100B
MSB1043		.equ  		0101111111011000B
MSB1045		.equ  		0110000000001101B
MSB1047		.equ  		0110000001000001B
MSB1049		.equ  		0110000001110101B
MSB1051		.equ  		0110000010101010B
MSB1053		.equ  		0110000011011110B
MSB1055		.equ  		0110000100010011B
MSB1057		.equ  		0110000101000111B
MSB1059		.equ  		0110000101111100B
MSB1061		.equ  		0110000110110000B
MSB1063		.equ  		0110000111100100B
MSB1065		.equ  		0110001000011001B
MSB1067		.equ  		0110001001001101B
MSB1069		.equ  		0110001010000010B
MSB1071		.equ  		0110001010110110B
MSB1073		.equ  		0110001011101011B
MSB1075		.equ  		0110001100011111B
MSB1077		.equ  		0110001101010011B
MSB1079		.equ  		0110001110001000B

LSB881		.equ  	1111001000010011B
LSB883		.equ  	0101111111011001B
LSB885		.equ  	1100110110011111B
LSB887		.equ  	0011101101100100B
LSB889		.equ  	1010100100101010B
LSB891		.equ  	0001011011110000B
LSB893		.equ  	1000010010110110B
LSB895		.equ  	1111001001111100B
LSB897		.equ  	0110000001000010B
LSB899		.equ  	1100111000000111B
LSB901		.equ  	0011101111001101B
LSB903		.equ  	1010100110010011B
LSB905		.equ  	0001011101011001B
LSB907		.equ  	1000010100011111B
LSB909		.equ  	1111001011100101B
LSB911		.equ  	0110000010101010B
LSB913		.equ  	1100111001110000B
LSB915		.equ  	0011110000110110B
LSB917		.equ  	1010100111111100B
LSB919		.equ  	0001011111000010B
LSB921		.equ  	1000010110001000B
LSB923		.equ  	1111001101001101B
LSB925		.equ  	0110000100010011B
LSB927		.equ  	1100111011011001B
LSB929		.equ  	0011110010011111B
LSB931		.equ  	1010101001100101B
LSB933		.equ  	0001100000101011B
LSB935		.equ  	1000010111110000B
LSB937		.equ  	1111001110110110B
LSB939		.equ  	0110000101111100B
LSB941		.equ  	1100111101000010B
LSB943		.equ  	0011110100001000B
LSB945		.equ  	1010101011001110B
LSB947		.equ  	0001100010010011B
LSB949		.equ  	1000011001011001B
LSB951		.equ  	1111010000011111B
LSB953		.equ  	0110000111100101B
LSB955		.equ  	1100111110101011B
LSB957		.equ  	0011110101110001B
LSB959		.equ  	1010101100110110B
LSB961		.equ  	0001100011111100B
LSB963		.equ  	1000011011000010B
LSB965		.equ  	1111010010001000B
LSB967		.equ  	0110001001001110B
LSB969		.equ  	1101000000010100B
LSB971		.equ  	0011110111011001B
LSB973		.equ  	1010101110011111B
LSB975		.equ  	0001100101100101B
LSB977		.equ  	1000011100101011B
LSB979		.equ  	1111010011110001B
LSB981		.equ  	0110001010110111B
LSB983		.equ  	1101000001111101B
LSB985		.equ  	0011111001000010B
LSB987		.equ  	1010110000001000B
LSB989		.equ  	0001100111001110B
LSB991		.equ  	1000011110010100B
LSB993		.equ  	1111010101011010B
LSB995		.equ  	0110001100100000B
LSB997		.equ  	1101000011100101B
LSB999		.equ  	0011111010101011B
LSB1001		.equ  	1010110001110001B
LSB1003		.equ  	0001101000110111B
LSB1005		.equ  	1000011111111101B
LSB1007		.equ  	1111010111000011B
LSB1009		.equ  	0110001110001000B
LSB1011		.equ  	1101000101001110B
LSB1013		.equ  	0011111100010100B
LSB1015		.equ  	1010110011011010B
LSB1017		.equ  	0001101010100000B
LSB1019		.equ  	1000100001100110B
LSB1021		.equ  	1111011000101011B
LSB1023		.equ  	0110001111110001B
LSB1025		.equ  	1101000110110111B
LSB1027		.equ  	0011111101111101B
LSB1029		.equ  	1010110101000011B
LSB1031		.equ  	0001101100001001B
LSB1033		.equ  	1000100011001110B
LSB1035		.equ  	1111011010010100B
LSB1037		.equ  	0110010001011010B
LSB1039		.equ  	1101001000100000B
LSB1041		.equ  	0011111111100110B
LSB1043		.equ  	1010110110101100B
LSB1045		.equ  	0001101101110001B
LSB1047		.equ  	1000100100110111B
LSB1049		.equ  	1111011011111101B
LSB1051		.equ  	0110010011000011B
LSB1053		.equ  	1101001010001001B
LSB1055		.equ  	0100000001001111B
LSB1057		.equ  	1010111000010100B
LSB1059		.equ  	0001101111011010B
LSB1061		.equ  	1000100110100000B
LSB1063		.equ  	1111011101100110B
LSB1065		.equ  	0110010100101100B
LSB1067		.equ  	1101001011110010B
LSB1069		.equ  	0100000010111000B
LSB1071		.equ  	1010111001111101B
LSB1073		.equ  	0001110001000011B
LSB1075		.equ  	1000101000001001B
LSB1077		.equ  	1111011111001111B
LSB1079		.equ  	0110010110010101B

PB_0        .equ     01000000B ; Port pin position P2.5  Station Down
PB_1        .equ     00100000B ; Port pin position P2.6  Station Up

TIMER_A0_COUNT_1   .equ   65534 ;Largest value possible



;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker

;-------------------------------------------------------------------------------


            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------



RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
;RAM Variables
			.bss	Station_Value,16
			.bss	PB_0_Mode,4 ;These Don't need to be that big
			.bss	PB_1_Mode,4 ;I just made them big so that they aren't picky about what you put in them
			.bss	MSB_Table,16 ;Holds values in the MSB Constants
			.bss	LSB_Table,16 ;Holds values in the LSB Constants 
			.bss	ISR_Notice,4 ;Do we need to go back to the mainloop?
			.bss	PB_Delay,16 ;This variable gets decremented to zero in the ISR for Debouncing
			.bss	Virgin,4    ;See PB comments


;-------------------------------------------------------------------------------
	;SETUP
SetupP1:
    ; The PushButtons are wired to P2.5,6,7 (active LOW), so we need to
    ; turn on the internal Pullup Resistors  - this is done with P2REN
    ; register

    ;
    mov    #PB_0+PB_1, &P2REN    ;turn on the internal resistor
    mov    #PB_0+PB_1, &P2OUT    ; set the resistor to Pullup mode

SetupTimerA0:
    ;these 3 lines of code sets up the TimerA_0
    mov.w   #TIMER_A0_COUNT_1,&TA0CCR0 ;load a count value into the counter
    mov.w   #CCIE,&TA0CCTL0        ; enable the timer interrupt
    mov.w   #TASSEL_2+ID_0+MC_1,&TA0CTL   ; select SMCLK/1, up mode

SetupPB1and2:
	; activate the General Purpose Digital I/O mode for P2.5 and P2.6
   	bic   #PB_0+PB_1, &P2SEL

    ;setup Port 2 interrupts for the pushbuttons
    bis   #PB_0+PB_1, &P2IE    ; enable interrput for Pushbutton
    bis   #PB_0+PB_1, &P2IES   ; set edge select for high to low trans

SetupADC:
	add		#ADC10ON + ADC10IE, &ADC10CTL0

   	mov 	#ADC10DIV_7, &ADC10CTL1 ; INCH =0000->A0,ADCCLK src = ADC10CLK,
                            		; ADCCLK/8,Single Channel Single Conversion
                            		; channel A0
    mov	 	#INCH_0, &ADC10AE0

    bis		#ENC + ADC10SC, ADC10CTL0

    clr.b   &P2IFG     ; clear the Int flag register for Port 2

    bis.w   #GIE,SR      ; enable interrupts

	mov		#0x00, Station_Value ;Start at 88.1MHz
	mov		#0B, &PB_1_Mode
	mov		#0B, &PB_0_Mode
	mov		#0x0, &ISR_Notice ;Superfluous
	mov 	#0, &Virgin 


;-------------------------------------------------------------------------------
	nop

Mainloop: ;Which Station are we tuning to
	mov		#0x0, &ISR_Notice

	cmp  	#1B, &PB_0_Mode         ;
	jeq     GoingUp                ;

	cmp		#1B, &PB_1_Mode
	jeq		GoingDown

    jmp STATION_FINDER

GoingUp:
	inc &Station_Value
	clr	&PB_0_Mode
	clr &PB_1_Mode
	jmp STATION_FINDER

GoingDown:
	dec &Station_Value
	clr	&PB_0_Mode
	clr &PB_1_Mode


STATION_FINDER:
	cmp		#0x00,&Station_Value
	jeq		Station1

	cmp		#0x01,&Station_Value
	jeq		Station2

	cmp		#0x02,&Station_Value
	jeq		Station3

	cmp		#0x03,&Station_Value
	jeq		Station4

	cmp		#0x04,&Station_Value
    jeq     Station5

    cmp		#0x05,&Station_Value
    jeq     Station6

    cmp		#0x06,&Station_Value
    jeq     Station7

    cmp		#0x07,&Station_Value
    jeq     Station8

    cmp		#0x08,&Station_Value
    jeq     Station9

    cmp		#0x09,&Station_Value
    jeq     Station10

    cmp		#0x010,&Station_Value
    jeq     Station11

    cmp		#0x011,&Station_Value
    jeq     Station12

    cmp		#0x012,&Station_Value
    jeq     Station13

    cmp		#0x013,&Station_Value
    jeq     Station14

    cmp		#0x014,&Station_Value
    jeq     Station15

    cmp		#0x015,&Station_Value
    jeq     Station16

    cmp		#0x016,&Station_Value
    jeq     Station17

    cmp		#0x017,&Station_Value
    jeq     Station18

    cmp		#0x018,&Station_Value
    jeq     Station19

    cmp		#0x019,&Station_Value
    jeq     Station20

    cmp		#0x020,&Station_Value
    jeq     Station21

    cmp		#0x021,&Station_Value
    jeq     Station22

    cmp		#0x022,&Station_Value
    jeq     Station23

    cmp		#0x023,&Station_Value
    jeq     Station24

    cmp		#0x024,&Station_Value
    jeq     Station25

    cmp		#0x025,&Station_Value
    jeq     Station26

    cmp		#0x026,&Station_Value
    jeq     Station27

    cmp		#0x027,&Station_Value
    jeq     Station28

    cmp		#0x028,&Station_Value
    jeq     Station29

    cmp		#0x029,&Station_Value
    jeq     Station30

    cmp		#0x030,&Station_Value
    jeq     Station31

    cmp		#0x031,&Station_Value
    jeq     Station32

    cmp		#0x032,&Station_Value
    jeq     Station33

    cmp		#0x033,&Station_Value
    jeq     Station34

    cmp		#0x034,&Station_Value
    jeq     Station35

    cmp		#0x035,&Station_Value
    jeq     Station36

    cmp		#0x036,&Station_Value
    jeq     Station37

    cmp		#0x037,&Station_Value
    jeq     Station38

    cmp		#0x038,&Station_Value
    jeq     Station39

    cmp		#0x039,&Station_Value
    jeq     Station40

    cmp		#0x040,&Station_Value
    jeq     Station41

    cmp		#0x041,&Station_Value
    jeq     Station42

    cmp		#0x042,&Station_Value
    jeq     Station43

    cmp		#0x043,&Station_Value
    jeq     Station44

    cmp		#0x044,&Station_Value
    jeq     Station45

    cmp		#0x045,&Station_Value
    jeq     Station46

    cmp		#0x046,&Station_Value
    jeq     Station47

    cmp		#0x047,&Station_Value
    jeq     Station48

    cmp		#0x048,&Station_Value
    jeq     Station49

    cmp		#0x049,&Station_Value
    jeq     Station50

    cmp		#0x050,&Station_Value
    jeq     Station51

    cmp		#0x051,&Station_Value
    jeq     Station52

    cmp		#0x052,&Station_Value
    jeq     Station53

    cmp		#0x053,&Station_Value
    jeq     Station54

    cmp		#0x054,&Station_Value
    jeq     Station55

    cmp		#0x055,&Station_Value
    jeq     Station56

    cmp		#0x056,&Station_Value
    jeq     Station57

    cmp		#0x057,&Station_Value
    jeq     Station58

    cmp		#0x058,&Station_Value
    jeq     Station59

    cmp		#0x059,&Station_Value
    jeq     Station60

    cmp		#0x060,&Station_Value
    jeq     Station61

    cmp		#0x061,&Station_Value
    jeq     Station62

    cmp		#0x062,&Station_Value
    jeq     Station63

    cmp		#0x063,&Station_Value
    jeq     Station64

    cmp		#0x064,&Station_Value
    jeq     Station65

    cmp		#0x065,&Station_Value
    jeq     Station66

    cmp		#0x066,&Station_Value
    jeq     Station67

    cmp		#0x067,&Station_Value
    jeq     Station68

    cmp		#0x068,&Station_Value
    jeq     Station69

    cmp		#0x069,&Station_Value
    jeq     Station70

    cmp		#0x070,&Station_Value
    jeq     Station71

    cmp		#0x071,&Station_Value
    jeq     Station72

    cmp		#0x072,&Station_Value
    jeq     Station73

    cmp		#0x073,&Station_Value
    jeq     Station74

    cmp		#0x074,&Station_Value
    jeq     Station75

    cmp		#0x075,&Station_Value
    jeq     Station76

    cmp		#0x076,&Station_Value
    jeq     Station77

    cmp		#0x077,&Station_Value
    jeq     Station78

    cmp		#0x078,&Station_Value
    jeq     Station79

    cmp		#0x079,&Station_Value
    jeq     Station80

    cmp		#0x080,&Station_Value
    jeq     Station81

    cmp		#0x081,&Station_Value
    jeq     Station82

    cmp		#0x082,&Station_Value
    jeq     Station83

    cmp		#0x083,&Station_Value
    jeq     Station84

    cmp		#0x084,&Station_Value
    jeq     Station85

    cmp		#0x085,&Station_Value
    jeq     Station86

    cmp		#0x086,&Station_Value
    jeq     Station87

    cmp		#0x087,&Station_Value
    jeq     Station88

    cmp		#0x088,&Station_Value
    jeq     Station89

    cmp		#0x089,&Station_Value
    jeq     Station90

    cmp		#0x090,&Station_Value
    jeq     Station91

    cmp		#0x091,&Station_Value
    jeq     Station92

    cmp		#0x092,&Station_Value
    jeq     Station93

    cmp		#0x093,&Station_Value
    jeq     Station94

    cmp		#0x094,&Station_Value
    jeq     Station95

    cmp		#0x095,&Station_Value
    jeq     Station96

    cmp		#0x096,&Station_Value
    jeq     Station97

    cmp		#0x097,&Station_Value
    jeq     Station98

    cmp		#0x098,&Station_Value
    jeq     Station99

    cmp		#0x099,&Station_Value
    jge      Station100
    jmp	    LoopBacktoStation1

Station1:
    mov		#MSB881, &MSB_Table
    mov		#LSB881, &LSB_Table

    jmp     OffsetUsingPot


Station2:
    mov		#MSB883, &MSB_Table
    mov		#LSB883, &LSB_Table

    jmp     OffsetUsingPot


Station3:
    mov		#MSB885, &MSB_Table
    mov		#LSB885, &LSB_Table

    jmp     OffsetUsingPot


Station4:
    mov		#MSB887, &MSB_Table
    mov		#LSB887, &LSB_Table

    jmp     OffsetUsingPot


Station5:
    mov		#MSB889, &MSB_Table
    mov		#LSB889, &LSB_Table

    jmp     OffsetUsingPot


Station6:
    mov		#MSB891, &MSB_Table
    mov		#LSB891, &LSB_Table

    jmp     OffsetUsingPot


Station7:
    mov		#MSB893, &MSB_Table
    mov		#LSB893, &LSB_Table

    jmp     OffsetUsingPot


Station8:
    mov		#MSB895, &MSB_Table
    mov		#LSB895, &LSB_Table

    jmp     OffsetUsingPot


Station9:
    mov		#MSB897, &MSB_Table
    mov		#LSB897, &LSB_Table

    jmp     OffsetUsingPot


Station10:
    mov		#MSB899, &MSB_Table
    mov		#LSB899, &LSB_Table

    jmp     OffsetUsingPot


Station11:
    mov		#MSB901, &MSB_Table
    mov		#LSB901, &LSB_Table

    jmp     OffsetUsingPot


Station12:
    mov		#MSB903, &MSB_Table
    mov		#LSB903, &LSB_Table

    jmp     OffsetUsingPot


Station13:
    mov		#MSB905, &MSB_Table
    mov		#LSB905, &LSB_Table

    jmp     OffsetUsingPot


Station14:
    mov		#MSB907, &MSB_Table
    mov		#LSB907, &LSB_Table

    jmp     OffsetUsingPot


Station15:
    mov		#MSB909, &MSB_Table
    mov		#LSB909, &LSB_Table

    jmp     OffsetUsingPot


Station16:
    mov		#MSB911, &MSB_Table
    mov		#LSB911, &LSB_Table

    jmp     OffsetUsingPot


Station17:
    mov		#MSB913, &MSB_Table
    mov		#LSB913, &LSB_Table

    jmp     OffsetUsingPot


Station18:
    mov		#MSB915, &MSB_Table
    mov		#LSB915, &LSB_Table

    jmp     OffsetUsingPot


Station19:
    mov		#MSB917, &MSB_Table
    mov		#LSB917, &LSB_Table

    jmp     OffsetUsingPot


Station20:
    mov		#MSB919, &MSB_Table
    mov		#LSB919, &LSB_Table

    jmp     OffsetUsingPot


Station21:
    mov		#MSB921, &MSB_Table
    mov		#LSB921, &LSB_Table

    jmp     OffsetUsingPot


Station22:
    mov		#MSB923, &MSB_Table
    mov		#LSB923, &LSB_Table

    jmp     OffsetUsingPot


Station23:
    mov		#MSB925, &MSB_Table
    mov		#LSB925, &LSB_Table

    jmp     OffsetUsingPot


Station24:
    mov		#MSB927, &MSB_Table
    mov		#LSB927, &LSB_Table

    jmp     OffsetUsingPot


Station25:
    mov		#MSB929, &MSB_Table
    mov		#LSB929, &LSB_Table

    jmp     OffsetUsingPot


Station26:
    mov		#MSB931, &MSB_Table
    mov		#LSB931, &LSB_Table

    jmp     OffsetUsingPot


Station27:
    mov		#MSB933, &MSB_Table
    mov		#LSB933, &LSB_Table

    jmp     OffsetUsingPot


Station28:
    mov		#MSB935, &MSB_Table
    mov		#LSB935, &LSB_Table

    jmp     OffsetUsingPot


Station29:
    mov		#MSB937, &MSB_Table
    mov		#LSB937, &LSB_Table

    jmp     OffsetUsingPot


Station30:
    mov		#MSB939, &MSB_Table
    mov		#LSB939, &LSB_Table

    jmp     OffsetUsingPot


Station31:
    mov		#MSB941, &MSB_Table
    mov		#LSB941, &LSB_Table

    jmp     OffsetUsingPot


Station32:
    mov		#MSB943, &MSB_Table
    mov		#LSB943, &LSB_Table

    jmp     OffsetUsingPot


Station33:
    mov		#MSB945, &MSB_Table
    mov		#LSB945, &LSB_Table

    jmp     OffsetUsingPot


Station34:
    mov		#MSB947, &MSB_Table
    mov		#LSB947, &LSB_Table

    jmp     OffsetUsingPot


Station35:
    mov		#MSB949, &MSB_Table
    mov		#LSB949, &LSB_Table

    jmp     OffsetUsingPot


Station36:
    mov		#MSB951, &MSB_Table
    mov		#LSB951, &LSB_Table

    jmp     OffsetUsingPot


Station37:
    mov		#MSB953, &MSB_Table
    mov		#LSB953, &LSB_Table

    jmp     OffsetUsingPot


Station38:
    mov		#MSB955, &MSB_Table
    mov		#LSB955, &LSB_Table

    jmp     OffsetUsingPot


Station39:
    mov		#MSB957, &MSB_Table
    mov		#LSB957, &LSB_Table

    jmp     OffsetUsingPot


Station40:
    mov		#MSB959, &MSB_Table
    mov		#LSB959, &LSB_Table

    jmp     OffsetUsingPot


Station41:
    mov		#MSB961, &MSB_Table
    mov		#LSB961, &LSB_Table

    jmp     OffsetUsingPot


Station42:
    mov		#MSB963, &MSB_Table
    mov		#LSB963, &LSB_Table

    jmp     OffsetUsingPot


Station43:
    mov		#MSB965, &MSB_Table
    mov		#LSB965, &LSB_Table

    jmp     OffsetUsingPot


Station44:
    mov		#MSB967, &MSB_Table
    mov		#LSB967, &LSB_Table

    jmp     OffsetUsingPot


Station45:
    mov		#MSB969, &MSB_Table
    mov		#LSB969, &LSB_Table

    jmp     OffsetUsingPot


Station46:
    mov		#MSB971, &MSB_Table
    mov		#LSB971, &LSB_Table

    jmp     OffsetUsingPot


Station47:
    mov		#MSB973, &MSB_Table
    mov		#LSB973, &LSB_Table

    jmp     OffsetUsingPot


Station48:
    mov		#MSB975, &MSB_Table
    mov		#LSB975, &LSB_Table

    jmp     OffsetUsingPot


Station49:
    mov		#MSB977, &MSB_Table
    mov		#LSB977, &LSB_Table

    jmp     OffsetUsingPot


Station50:
    mov		#MSB979, &MSB_Table
    mov		#LSB979, &LSB_Table

    jmp     OffsetUsingPot


Station51:
    mov		#MSB981, &MSB_Table
    mov		#LSB981, &LSB_Table

    jmp     OffsetUsingPot


Station52:
    mov		#MSB983, &MSB_Table
    mov		#LSB983, &LSB_Table

    jmp     OffsetUsingPot


Station53:
    mov		#MSB985, &MSB_Table
    mov		#LSB985, &LSB_Table

    jmp     OffsetUsingPot


Station54:
    mov		#MSB987, &MSB_Table
    mov		#LSB987, &LSB_Table

    jmp     OffsetUsingPot


Station55:
    mov		#MSB989, &MSB_Table
    mov		#LSB989, &LSB_Table

    jmp     OffsetUsingPot


Station56:
    mov		#MSB991, &MSB_Table
    mov		#LSB991, &LSB_Table

    jmp     OffsetUsingPot


Station57:
    mov		#MSB993, &MSB_Table
    mov		#LSB993, &LSB_Table

    jmp     OffsetUsingPot


Station58:
    mov		#MSB995, &MSB_Table
    mov		#LSB995, &LSB_Table

    jmp     OffsetUsingPot


Station59:
    mov		#MSB997, &MSB_Table
    mov		#LSB997, &LSB_Table

    jmp     OffsetUsingPot


Station60:
    mov		#MSB999, &MSB_Table
    mov		#LSB999, &LSB_Table

    jmp     OffsetUsingPot


Station61:
    mov		#MSB1001, &MSB_Table
    mov		#LSB1001, &LSB_Table

    jmp     OffsetUsingPot


Station62:
    mov		#MSB1003, &MSB_Table
    mov		#LSB1003, &LSB_Table

    jmp     OffsetUsingPot


Station63:
    mov		#MSB1005, &MSB_Table
    mov		#LSB1005, &LSB_Table

    jmp     OffsetUsingPot


Station64:
    mov		#MSB1007, &MSB_Table
    mov		#LSB1007, &LSB_Table

    jmp     OffsetUsingPot


Station65:
    mov		#MSB1009, &MSB_Table
    mov		#LSB1009, &LSB_Table

    jmp     OffsetUsingPot


Station66:
    mov		#MSB1011, &MSB_Table
    mov		#LSB1011, &LSB_Table

    jmp     OffsetUsingPot


Station67:
    mov		#MSB1013, &MSB_Table
    mov		#LSB1013, &LSB_Table

    jmp     OffsetUsingPot


Station68:
    mov		#MSB1015, &MSB_Table
    mov		#LSB1015, &LSB_Table

    jmp     OffsetUsingPot


Station69:
    mov		#MSB1017, &MSB_Table
    mov		#LSB1017, &LSB_Table

    jmp     OffsetUsingPot


Station70:
    mov		#MSB1019, &MSB_Table
    mov		#LSB1019, &LSB_Table

    jmp     OffsetUsingPot


Station71:
    mov		#MSB1021, &MSB_Table
    mov		#LSB1021, &LSB_Table

    jmp     OffsetUsingPot


Station72:
    mov		#MSB1023, &MSB_Table
    mov		#LSB1023, &LSB_Table

    jmp     OffsetUsingPot


Station73:
    mov		#MSB1025, &MSB_Table
    mov		#LSB1025, &LSB_Table

    jmp     OffsetUsingPot


Station74:
    mov		#MSB1027, &MSB_Table
    mov		#LSB1027, &LSB_Table

    jmp     OffsetUsingPot


Station75:
    mov		#MSB1029, &MSB_Table
    mov		#LSB1029, &LSB_Table

    jmp     OffsetUsingPot


Station76:
    mov		#MSB1031, &MSB_Table
    mov		#LSB1031, &LSB_Table

    jmp     OffsetUsingPot


Station77:
    mov		#MSB1033, &MSB_Table
    mov		#LSB1033, &LSB_Table

    jmp     OffsetUsingPot


Station78:
    mov		#MSB1035, &MSB_Table
    mov		#LSB1035, &LSB_Table

    jmp     OffsetUsingPot


Station79:
    mov		#MSB1037, &MSB_Table
    mov		#LSB1037, &LSB_Table

    jmp     OffsetUsingPot


Station80:
    mov		#MSB1039, &MSB_Table
    mov		#LSB1039, &LSB_Table

    jmp     OffsetUsingPot


Station81:
    mov		#MSB1041, &MSB_Table
    mov		#LSB1041, &LSB_Table

    jmp     OffsetUsingPot


Station82:
    mov		#MSB1043, &MSB_Table
    mov		#LSB1043, &LSB_Table

    jmp     OffsetUsingPot


Station83:
    mov		#MSB1045, &MSB_Table
    mov		#LSB1045, &LSB_Table

    jmp     OffsetUsingPot


Station84:
    mov		#MSB1047, &MSB_Table
    mov		#LSB1047, &LSB_Table

    jmp     OffsetUsingPot


Station85:
    mov		#MSB1049, &MSB_Table
    mov		#LSB1049, &LSB_Table

    jmp     OffsetUsingPot


Station86:
    mov		#MSB1051, &MSB_Table
    mov		#LSB1051, &LSB_Table

    jmp     OffsetUsingPot


Station87:
    mov		#MSB1053, &MSB_Table
    mov		#LSB1053, &LSB_Table

    jmp     OffsetUsingPot


Station88:
    mov		#MSB1055, &MSB_Table
    mov		#LSB1055, &LSB_Table

    jmp     OffsetUsingPot


Station89:
    mov		#MSB1057, &MSB_Table
    mov		#LSB1057, &LSB_Table

    jmp     OffsetUsingPot


Station90:
    mov		#MSB1059, &MSB_Table
    mov		#LSB1059, &LSB_Table

    jmp     OffsetUsingPot


Station91:
    mov		#MSB1061, &MSB_Table
    mov		#LSB1061, &LSB_Table

    jmp     OffsetUsingPot


Station92:
    mov		#MSB1063, &MSB_Table
    mov		#LSB1063, &LSB_Table

    jmp     OffsetUsingPot


Station93:
    mov		#MSB1065, &MSB_Table
    mov		#LSB1065, &LSB_Table

    jmp     OffsetUsingPot


Station94:
    mov		#MSB1067, &MSB_Table
    mov		#LSB1067, &LSB_Table

    jmp     OffsetUsingPot


Station95:
    mov		#MSB1069, &MSB_Table
    mov		#LSB1069, &LSB_Table

    jmp     OffsetUsingPot


Station96:
    mov		#MSB1071, &MSB_Table
    mov		#LSB1071, &LSB_Table

    jmp     OffsetUsingPot


Station97:
    mov		#MSB1073, &MSB_Table
    mov		#LSB1073, &LSB_Table

    jmp     OffsetUsingPot


Station98:
    mov		#MSB1075, &MSB_Table
    mov		#LSB1075, &LSB_Table

    jmp     OffsetUsingPot


Station99:
	mov		#0x98,&Station_Value
    mov		#MSB1077, &MSB_Table
    mov		#LSB1077, &LSB_Table

    jmp     OffsetUsingPot


Station100:
	mov		#0x99, &Station_Value

    mov		#MSB1079, &MSB_Table
    mov		#LSB1079, &LSB_Table

    jmp     OffsetUsingPot

LoopBacktoStation1:
	mov		#0x00,&Station_Value
    mov		#MSB1079, &MSB_Table
    mov		#LSB1079, &LSB_Table

    jmp     Station1

OffsetUsingPot:
	bis		#ENC + ADC10SC, ADC10CTL0
	add		ADC10MEM, &LSB_Table


;Copy/Pasted Directly from QEXfiles sample library
;Code Modified to 45.9MHz
UpdateDDS:
    mov.b   #(BIT1|BIT3|BIT5),&P1DIR ; P1.1, P1.3, P1.5 pins as outputs.
	                             ; P1.1 = Connect to DATA pin on AD9850 module
                                 ; P1.3 = Connect to FQ_UD pin on AD9850 module
                                 ; P1.5 = Connect to W_CLK pin on AD9850 module

;-----------------(Load Serial-Load Enable Word into Registers)--------------------
    mov     #0, R6        ; Moves "0" into Register 6
	                      ; BITs (0-15) of the 40-BIT Serial-Load Enable Word
    mov     #0, R7        ; Moves "0" into Register 7
	                      ; BITs (16-31) of the 40-BIT Serial-Load Enable Word
    mov     #0, R8        ; Moves "0" into Register 8
	                      ; BITs (32-39) of the 40-BIT Serial-Load Enable Word


;--------------------(Load Calculated Tuning Word into Registers)-------------------
    mov     &MSB_Table, R10   ; Moves the  into Register 10
	                      ; BITs (0-15) of the 40-BIT Tuning Word
    mov     &LSB_Table, R11    ; Moves "3693" into Register 11
	                      ; BITs (16-31) of the 40-BIT Tuning Word
    mov     #0, R12       ; Moves "0" into Register 12
	                      ; BITs (32-39) of the 40-BIT Tuning Word
; ;---------------------------------------------------------------------------------- 
; ;----------------DEVELOPMENT OF THE 40-BIT SERIAL-LOAD ENABLE WORD----------------- 
;---------------(Creates initial W_CLK pulse and intial FQ_UD pulse)---------------

 
;-----------------(Required to Reset Control Registers)----------------------------
;Pin 2 is D2, Pin 3 is D1, pin 7 is D0
;Ground Pin 2 and set pins 3 and 4 to VCC for default Serial Communication
	cmp		#1, &Virgin
	jeq		FIXABLEISSUE ;See Above

    bis.b   #BIT5, &P1OUT          ; Clock Pulse "ON"
    nop                            ; Delay
    bic.b   #BIT5, &P1OUT          ; Clock Pulse "OFF"
    nop                            ; Delay
    nop                            ; Delay
    nop                            ; Delay
    bis.b   #BIT3, &P1OUT          ; FREQ UPDATE "ON"
    nop                            ; Delay
    nop                            ; Delay
    nop                            ; Delay
    bic.b   #BIT3, &P1OUT          ; FREQ UPDATE "OFF"
;-------------(Reads Registers 6, 7, and 8 and creates "1"s and "0"s)-------------
    mov     #0, R5                 ; Zero out Counter
READ_R6:
    cmp     #16, R5                ; R5 = the Counter
    jeq     GOTO_R7                ; If Counter = 16 GOTO_R7
    rrc	    R6                     ; Roll Right thru the "Carry BIT"
    jc      MAKE_ONE_R6            ; "Carry BIT" is set (holds a "1") jump
    jmp     MAKE_ZERO_R6           ; "Carry BIT" is not set (holds a "0") jump
MAKE_ZERO_R6:
    bic.b   #BIT1, &P1OUT          ; Put a "0" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    bic.b   #BIT1, &P1OUT          ; "0" still on DATA line
    add     #1, R5                 ; Add one to the Counter
    jmp     READ_R6                ; Go read another BIT from R6
MAKE_ONE_R6:
    bis.b   #BIT1, &P1OUT          ; Put a "1" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    bic.b   #BIT1, &P1OUT          ; Take "1" off DATA line
    add     #1, R5                 ; Add one to the Counter
    jmp     READ_R6                ; Go read another BIT from R6
GOTO_R7:
    mov     #0, R5                 ; Zero out Counter
READ_R7:
    cmp     #16, R5                ; R5 = the Counter
    jeq     GOTO_R8                ; If Counter = 16 GOTO_R8
    rrc	    R7                     ; Roll Right thru the "Carry BIT"
    jc      MAKE_ONE_R7            ; If "Carry BIT" holds a "1" jump
    jmp     MAKE_ZERO_R7           ; If "Carry BIT" holds a "0" jump
MAKE_ZERO_R7:
    bic.b   #BIT1, &P1OUT          ; Put a "0" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    bic.b   #BIT1, &P1OUT          ; "0" still on DATA line
    add     #1, R5                 ; Add one to the Counter
    jmp     READ_R7                ; Go read another BIT from R7
MAKE_ONE_R7:
    bis.b   #BIT1, &P1OUT          ; Put a "1" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    bic.b   #BIT1, &P1OUT          ; Take "1" off DATA line
    add     #1, R5                 ; Add one to the Counter
    jmp     READ_R7                ; Go read another BIT from R7
GOTO_R8:
    mov     #0, R5                 ; Zero out Counter
READ_R8:
    rrc	    R8                     ; Roll Right thru the "Carry BIT"
    jc      MAKE_ONE_R8            ; If "Carry BIT" holds a "1" jump
    jmp     MAKE_ZERO_R8           ; If "Carry BIT" holds a "0" jump
MAKE_ZERO_R8:
    bic.b   #BIT1, &P1OUT          ; Put a "0" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    add     #1, R5                 ; Add one to the Counter
    cmp     #8, R5                 ; Have 8 BITs been read yet?
    jeq     SET_CONTROL_BITS       ; If "YES" goto
    bic.b   #BIT1, &P1OUT          ; "0" still on DATA line
    jmp     READ_R8                ; Go read another BIT from R8
MAKE_ONE_R8:
    bis.b   #BIT1, &P1OUT          ; Put a "1" on DATA line
    bis.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "ON"
    bic.b   #BIT5, &P1OUT          ; WORD CLOCK Pulse "OFF"
    add     #1, R5                 ; Add one to the Counter
    cmp     #8, R5                 ; Have 8 BITs been read yet?
    jeq     SET_CONTROL_BITS       ; If "YES" goto
    bic.b   #BIT1, &P1OUT          ; Take "1" off DATA line
    jmp     READ_R8                ; Go read another BIT from R8
SET_CONTROL_BITS:
    bis.b   #BIT3, &P1OUT          ; Reset Control Word (FREQ_UPDATE "ON")
    bic.b   #BIT1, &P1OUT          ; Remove "1" (or "0") from DATA line
    bic.b   #BIT3, &P1OUT          ; Reset Control Word (FREQ_UPDATE "OFF")

FIXABLEISSUE:
;--------------DEVELOPMENT OF THE 40-BIT TUNING WORD-------------------------
;---------(Reads registers 10, 11, and 12 and creates "1"s and "0"s)---------
    mov     #0, R5                 ; Reset the Counter
READ_R10:
    rrc	    R10
    jc      MAKE_ONE_R10
    jmp     MAKE_ZERO_R10
MAKE_ZERO_R10:
    bic.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    bic.b   #BIT1, &P1OUT
    add     #1, R5
    cmp     #16, R5
    jeq     GOTO_R11
    jmp     READ_R10
MAKE_ONE_R10:
    bis.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    bic.b   #BIT1, &P1OUT
    add     #1, R5
    cmp     #16, R5
    jeq     GOTO_R11
    jmp     READ_R10
GOTO_R11:
    mov     #0, R5
READ_R11:
    rrc	    R11
    jc      MAKE_ONE_R11
    jmp     MAKE_ZERO_R11
MAKE_ZERO_R11:
    bic.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    bic.b   #BIT1, &P1OUT
    add     #1, R5
    cmp     #16, R5
    jeq     GOTO_R12
    jmp     READ_R11
MAKE_ONE_R11:
    bis.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    bic.b   #BIT1, &P1OUT
    add     #1, R5
    cmp     #16, R5
    jeq     GOTO_R12
    jmp     READ_R11
GOTO_R12:
    mov     #0, R5
READ_R12:
    rrc	    R12
    jc      MAKE_ONE_R12
    jmp     MAKE_ZERO_R12
MAKE_ZERO_R12:
    bic.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    add     #1, R5
    cmp     #8, R5
    jeq     FREQ_UPDATE
    bic.b   #BIT1, &P1OUT
    jmp     READ_R12
MAKE_ONE_R12:
    bis.b   #BIT1, &P1OUT
    bis.b   #BIT5, &P1OUT
    bic.b   #BIT5, &P1OUT
    add     #1, R5
    cmp     #8, R5
    jeq     FREQ_UPDATE
    bic.b   #BIT1, &P1OUT
    jmp     READ_R12
FREQ_UPDATE:
    bis.b   #BIT3, &P1OUT          ; FREQ_UPDATE Pulse "ON"
    bic.b   #BIT1, &P1OUT          ; DATA BIT 39 turned "OFF", see Figure 24 datasheet
    bic.b   #BIT3, &P1OUT          ; FREQ_UPDATE Pulse "OFF"
	mov		#1, &Virgin

END: ;The Sythesizer is written
	cmp  	#0x1, &ISR_Notice      ;Did we get a new frequency?
	jeq     Mainloop               ;If So, we need to update it

	jmp END ;If not, we don't need to do anything
;-------------------------------------------------------------------------------
; Interrupt Service Routines
;-------------------------------------------------------------------------------
ADC10_ISR: ;This is from the ADC
			bic.w   #CPUOFF,0(SP)           ; Exit LPM0 on reti
			;bis		#ENC + ADC10SC, ADC10CTL0
			;mov #0x1, &ISR_Notice ;Calls this too often for this to be a good solution

            reti                            ;

Port2_ISR: ;Copy/Pasted Microcontrollers Code with minor edits for Code Composer Studio Syntax
    ; if we get to here, an interrupt occurred on the Port 2

    mov #0x9999, &PB_Delay ;This should tie up the processor for a little bit
Delay:
    dec &PB_Delay
    cmp #0x01, &PB_Delay
    nop
    jl	Delay

    mov #0x1, &ISR_Notice ;We need to update every time we switch to a different station
    bit.b  #PB_0, &P2IFG   ; PB_0 Pushbutton?  (if 1 it is pressed)
    jnz  PB_0_Case        ; it is PB_0
    ;no so try the next case

    bit.b  #PB_1, &P2IFG   ; PB_1 Pushbutton?  (if 1 it is pressed)
    jnz  PB_1_Case        ; it is PB_1

    jmp  DoneWithPort_2_ISR       ; no, so don't do anything

PB_0_Case: ;Labels May not work in ISRs
    mov  #1B,  &PB_0_Mode
    clr.b &PB_1_Mode
    jmp DoneWithPort_2_ISR

PB_1_Case:
    mov #1B,  &PB_1_Mode
    clr.b &PB_0_Mode
    jmp DoneWithPort_2_ISR

DoneWithPort_2_ISR:
    clr &P2IFG    ; clear the flag so system is ready for another interrupt
    reti        ; return from interrupt

TA1_ISR:
      mov #0x1, &ISR_Notice
      reti    ; return from interrupt

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack

;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
            .sect ".int05"					;ADC10 Vector
            .short ADC10_ISR

            .sect ".int03"
            .short Port2_ISR

            .sect ".int09"
            .short TA1_ISR

            .end



