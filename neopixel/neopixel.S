/*
 * DDRB:  0x17
 * PORTB: 0x18
 * PINB:  0x16
 */

/*
 * r23: G, R, B, temp
 */

#define INPUT_PIN 2
#define OUTPUT_PIN 3

/*
 * PB0/OC0A: 0x29
 * PB1/OC1A: 0x2E
 * PB4/OC1B: 0x2B
 */

#define GREEN_REG 0x29
#define RED_REG 0x2E
#define BLUE_REG 0x2B

#define OUTPUT_INVERT
//#define OUTPUT_POSITIVE

#if defined(OUTPUT_POSITIVE) && defined(OUTPUT_INVERT)
#error "OUTPUT_INVERT and OUTPUT_POSITIVE must not be defined same time."
#elif defined(OUTPUT_POSITIVE)
#define SET_BIT sbr
#elif defined(OUTPUT_INVERT)
#define SET_BIT cbr
#else
#error "OUTPUT_INVERT or OUTPUT_POSITIVE must be defined"
#endif

#define NOP1 nop
#define NOP2 nop
#define NOP3
#define CHECK_INPUT1() nop
#define JUMP_LOW1(i) nop
#define CHECK_INPUT2() sbis 0x16, INPUT_PIN
#define JUMP_LOW2(i) rjmp self_input_low##i


.global main
.func main
main:
    ldi r23, 0x13;
    out 0x17, r23; // set P0,1,4 output

    ldi r23, 0x01; // start clock0
    out 0x33, r23;

    ldi r23, 0x81; //set P0(G) OC0A enable, WGM:Phase Correct PWM
    out 0x2A, r23;

    ldi r23, 0x60; //set P4(B) OC1B enable and PWM1A enable
    out 0x2C, r23;

    ldi r23, 0x61; //set P1(R) OC1A enable, PWM1B enable, start clock1
    out 0x30, r23;

    cli;
    sbi 0x17,OUTPUT_PIN; set OUTPUT_PIN as output
    cbi 0x17,INPUT_PIN;  set INPUT_PIN as input

    cbi 0x18, OUTPUT_PIN;
    
#if defined(OUTPUT_POSITIVE)
    clr r23;
#elif defined(OUTPUT_INVERT)
    ser r23;
#endif
    rjmp wait;

wait:
    sbis 0x16, INPUT_PIN;
    rjmp wait;

self:
;1
    NOP1;
    NOP2;
    NOP3;
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
    NOP3;
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
    NOP3;
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
    NOP3;
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
    NOP3;
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
    NOP3;
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
    NOP3;
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
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(8);
    CHECK_INPUT2();
    JUMP_LOW2(8);
    SET_BIT r23, 1;
self_t1h_8:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_8;
self_input_low8:
    out GREEN_REG, r23;
#if defined(OUTPUT_POSITIVE)
    clr r23;
#elif defined(OUTPUT_INVERT)
    ser r23;
#endif
self_input_low8_actual:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low8_actual;

;9
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(9);
    CHECK_INPUT2();
    JUMP_LOW2(9);
    SET_BIT r23, 128;
self_t1h_9:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_9;
self_input_low9:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low9;

;10
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(10);
    CHECK_INPUT2();
    JUMP_LOW2(10);
    SET_BIT r23, 64;
self_t1h_10:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_10;
self_input_low10:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low10;

;11
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(11);
    CHECK_INPUT2();
    JUMP_LOW2(11);
    SET_BIT r23, 32;
self_t1h_11:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_11;
self_input_low11:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low11;

;12
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(12);
    CHECK_INPUT2();
    JUMP_LOW2(12);
    SET_BIT r23, 16;
self_t1h_12:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_12;
self_input_low12:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low12;

;13
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(13);
    CHECK_INPUT2();
    JUMP_LOW2(13);
    SET_BIT r23, 8;
self_t1h_13:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_13;
self_input_low13:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low13;

;14
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(14);
    CHECK_INPUT2();
    JUMP_LOW2(14);
    SET_BIT r23, 4;
self_t1h_14:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_14;
self_input_low14:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low14;

;15
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(15);
    CHECK_INPUT2();
    JUMP_LOW2(15);
    SET_BIT r23, 2;
self_t1h_15:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_15;
self_input_low15:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low15;

;16
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(16);
    CHECK_INPUT2();
    JUMP_LOW2(16);
    SET_BIT r23, 1;
self_t1h_16:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_16;
self_input_low16:
    out RED_REG, r23;
#if defined(OUTPUT_POSITIVE)
    clr r23;
#elif defined(OUTPUT_INVERT)
    ser r23;
#endif
self_input_low16_actual:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low16_actual;

;17
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(17);
    CHECK_INPUT2();
    JUMP_LOW2(17);
    SET_BIT r23, 128;
self_t1h_17:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_17;
self_input_low17:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low17;

;18
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(18);
    CHECK_INPUT2();
    JUMP_LOW2(18);
    SET_BIT r23, 64;
self_t1h_18:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_18;
self_input_low18:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low18;

;19
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(19);
    CHECK_INPUT2();
    JUMP_LOW2(19);
    SET_BIT r23, 32;
self_t1h_19:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_19;
self_input_low19:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low19;

;20
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(20);
    CHECK_INPUT2();
    JUMP_LOW2(20);
    SET_BIT r23, 16;
self_t1h_20:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_20;
self_input_low20:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low20;

;21
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(21);
    CHECK_INPUT2();
    JUMP_LOW2(21);
    SET_BIT r23, 8;
self_t1h_21:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_21;
self_input_low21:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low21;

;22
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(22);
    CHECK_INPUT2();
    JUMP_LOW2(22);
    SET_BIT r23, 4;
self_t1h_22:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_22;
self_input_low22:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low22;

;23
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(23);
    CHECK_INPUT2();
    JUMP_LOW2(23);
    SET_BIT r23, 2;
self_t1h_23:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_23;
self_input_low23:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low23;

;24
    NOP1;
    NOP2;
    NOP3;
    CHECK_INPUT1();
    JUMP_LOW1(24);
    CHECK_INPUT2();
    JUMP_LOW2(24);
    SET_BIT r23, 1;
self_t1h_24:
    sbic 0x16, INPUT_PIN;
    rjmp self_t1h_24;
self_input_low24:
    out BLUE_REG, r23;
#if defined(OUTPUT_POSITIVE)
    clr r23;
#elif defined(OUTPUT_INVERT)
    ser r23;
#endif
self_input_low24_actual:
    sbis 0x16, INPUT_PIN;
    rjmp self_input_low24_actual;


/* T0H is 5clk, T1H is 10clk */
pass_through:
; T0H
    sbi 0x18, OUTPUT_PIN; 2clk
    nop;
    nop;
    sbis 0x16, INPUT_PIN; 1+clk
    cbi 0x18, OUTPUT_PIN;  2clk
    sbis 0x16, INPUT_PIN; 1+clk
    rjmp input_is_low_pre; 2clk
    sbis 0x16, INPUT_PIN; 1+clk
    rjmp input_is_low_pre; 2clk
    sbis 0x16, INPUT_PIN; 1+clk
    rjmp input_is_low_pre; 2clk
    sbis 0x16, INPUT_PIN; 1+clk
    rjmp input_is_low_pre; 2clk
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
    rjmp wait;

.endfunc
