/*
 * DDRB:  0x17
 * PORTB: 0x18
 * PINB:  0x16
 */

/*
 * r23: G
 * r24: R
 * r25: B
 */

/*
 * input: 2
 * output: 3
 */

#define INPUT_PIN 2
#define OUTPUT_PIN 3

#define GREEN_PIN 0
#define RED_PIN 1
#define BLUE_PIN 4

//#define OUTPUT_INVERT
#define OUTPUT_POSITIVE

#if defined(OUTPUT_INVERT)
#if defined(OUTPUT_POSITIVE)
#error "OUTPUT_INVERT and OUTPUT_POSITIVE must not be defined same time."
#else
#define SET_BIT cbr 
#endif 
#elif defined(OUTPUT_POSITIVE)
#define SET_BIT sbr
#else
#error "OUTPUT_INVERT or OUTPUT_POSITIVE must be defined"
#endif

#define NOP1 nop
#define NOP2
#define CHECK_INPUT1() nop
#define JUMP_LOW1(i) nop
#define CHECK_INPUT2() sbis 0x16, INPUT_PIN
#define JUMP_LOW2(i) rjmp self_input_low##i


.global setup
.func setup
setup:
    
.endfunc

.global loop
.func loop
loop:
    cli;
    sbi 0x17,OUTPUT_PIN; set OUTPUT_PIN as output
    cbi 0x17,INPUT_PIN;  set INPUT_PIN as input

    cbi 0x18, OUTPUT_PIN;
    rjmp wait_prepare;

wait:
    sbis 0x16, INPUT_PIN;
    rjmp wait;
    
self:
;1
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(1);
    CHECK_INPUT2();
    JUMP_LOW2(1);
    SET_BIT r23, 128;
self_t1h_1:
    sbic 0x16, INPUT_PIN; 11
    rjmp self_t1h_1; 12,13
self_input_low1:
    sbis 0x16, INPUT_PIN; 14 ;1
    rjmp self_input_low1; 15,16 ;2,3

;2
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(2);
    CHECK_INPUT2();
    JUMP_LOW2(2);
    SET_BIT r23, 64;
self_t1h_2:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_2;
self_input_low2:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low2;

;3
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(3);
    CHECK_INPUT2();
    JUMP_LOW2(3);
    SET_BIT r23, 32;
self_t1h_3:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_3;
self_input_low3:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low3;

;4
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(4);
    CHECK_INPUT2();
    JUMP_LOW2(4);
    SET_BIT r23, 16;
self_t1h_4:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_4;
self_input_low4:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low4;

;5
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(5);
    CHECK_INPUT2();
    JUMP_LOW2(5);
    SET_BIT r23, 8;
self_t1h_5:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_5;
self_input_low5:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low5;

;6
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(6);
    CHECK_INPUT2();
    JUMP_LOW2(6);
    SET_BIT r23, 4;
self_t1h_6:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_6;
self_input_low6:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low6;

;7
     NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(7);
    CHECK_INPUT2();
    JUMP_LOW2(7);
    SET_BIT r23, 2;
self_t1h_7:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_7;
self_input_low7:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low7;

;8
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(8);
    CHECK_INPUT2();
    JUMP_LOW2(8);
    SET_BIT r23, 1;
self_t1h_8:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_8;
self_input_low8:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low8;

;9
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(9);
    CHECK_INPUT2();
    JUMP_LOW2(9);
    SET_BIT r24, 128;
self_t1h_9:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_9;
self_input_low9:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low9;

;10
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(10);
    CHECK_INPUT2();
    JUMP_LOW2(10);
    SET_BIT r24, 64;
self_t1h_10:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_10;
self_input_low10:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low10;

;11
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(11);
    CHECK_INPUT2();
    JUMP_LOW2(11);
    SET_BIT r24, 32;
self_t1h_11:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_11;
self_input_low11:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low11;

;12
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(12);
    CHECK_INPUT2();
    JUMP_LOW2(12);
    SET_BIT r24, 16;
self_t1h_12:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_12;
self_input_low12:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low12;

;13
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(13);
    CHECK_INPUT2();
    JUMP_LOW2(13);
    SET_BIT r24, 8;
self_t1h_13:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_13;
self_input_low13:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low13;

;14
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(14);
    CHECK_INPUT2();
    JUMP_LOW2(14);
    SET_BIT r24, 4;
self_t1h_14:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_14;
self_input_low14:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low14;

;15
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(15);
    CHECK_INPUT2();
    JUMP_LOW2(15);
    SET_BIT r24, 2;
self_t1h_15:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_15;
self_input_low15:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low15;

;16
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(16);
    CHECK_INPUT2();
    JUMP_LOW2(16);
    SET_BIT r24, 1;
self_t1h_16:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_16;
self_input_low16:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low16;

;17
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(17);
    CHECK_INPUT2();
    JUMP_LOW2(17);
    SET_BIT r25, 128;
self_t1h_17:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_17;
self_input_low17:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low17;

;18
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(18);
    CHECK_INPUT2();
    JUMP_LOW2(18);
    SET_BIT r25, 64;
self_t1h_18:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_18;
self_input_low18:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low18;

;19
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(19);
    CHECK_INPUT2();
    JUMP_LOW2(19);
    SET_BIT r25, 32;
self_t1h_19:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_19;
self_input_low19:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low19;

;20
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(20);
    CHECK_INPUT2();
    JUMP_LOW2(20);
    SET_BIT r25, 16;
self_t1h_20:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_20;
self_input_low20:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low20;

;21
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(21);
    CHECK_INPUT2();
    JUMP_LOW2(21);
    SET_BIT r25, 8;
self_t1h_21:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_21;
self_input_low21:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low21;

;22
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(22);
    CHECK_INPUT2();
    JUMP_LOW2(22);
    SET_BIT r25, 4;
self_t1h_22:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_22;
self_input_low22:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low22;

;23
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(23);
    CHECK_INPUT2();
    JUMP_LOW2(23);
    SET_BIT r25, 2;
self_t1h_23:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_23;
self_input_low23:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low23;

;24
    NOP1;
    NOP2;
    CHECK_INPUT1();
    JUMP_LOW1(24);
    CHECK_INPUT2();
    JUMP_LOW2(24);
    SET_BIT r25, 1;
self_t1h_24:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_24;
self_input_low24:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low24;


/* T0H is 5clk, T1H is 10clk */
pass_through:
; T0H
    sbi 0x18, OUTPUT_PIN; 2clk
    nop;
    sbis 0x16, INPUT_PIN; 1+clk
    cbi 0x18, OUTPUT_PIN;  2clk
    sbis 0x16, INPUT_PIN; 1+clk
    cbi 0x18, OUTPUT_PIN;  2clk
    sbis 0x16, INPUT_PIN; 1+clk
    rjmp input_is_low_pre; 2clk
    
    cbi 0x18, OUTPUT_PIN; clear output
    sbis 0x16, INPUT_PIN;
    rjmp input_is_low;
    sbis 0x16, INPUT_PIN;
    rjmp input_is_low;
    sbis 0x16, INPUT_PIN;
    rjmp input_is_low;
    sbis 0x16, INPUT_PIN;
    rjmp input_is_low;
input_is_low_pre:
    cbi 0x18, OUTPUT_PIN;  2clk
input_is_low:
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    sbic 0x16, INPUT_PIN;
    rjmp pass_through;
    rjmp write_pwm;

/*
 * PB0: G
 * PB1: R
 * PB4: B
 */
write_pwm:
    push r25;
    push r24;
    
    ldi r25, 0;
    ldi r24, GREEN_PIN;
    mov r22,r23;
    ldi r23, 0;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, RED_PIN;
    pop r22;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, BLUE_PIN;
    pop r22;
    rcall analogWrite;

wait_prepare:
#if defined(OUTPUT_POSITIVE)
    clr r23;
    clr r24;
    clr r25;
#elif defined(OUTPUT_INVERT)
    ser r23;
    ser r24;
    ser r25;
#endif
    rjmp wait;

.endfunc
