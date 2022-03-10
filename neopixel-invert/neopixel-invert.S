/* #include <avr/io.h> */
/*
 * DDRB:  0x17
 * PORTB: 0x18
 * PINB:  0x16
 */

/*
 * r17: detect reset(low count)
 * r16: count pulse
 * r18: 1
 * r20: High signal timer
 */

/*
 * input: 3
 * output: 2
 */
.global setup
.func setup
setup:
    
.endfunc

.global loop
.func loop
loop:
    cli;
    ldi r18, 1;
    sbi 0x17,2 ; set B2 as output
    cbi 0x17,3 ; set B3 as input

    cbi 0x18, 2;
    rjmp wait_prepare;
    
ignore:
;1
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low1;
    sbis 0x16, 3;
    rjmp ignore_input_low1;
    cbr r23, 128;
ignore_t1h_1:
    sbic 0x16, 3;
    rjmp ignore_t1h_1;
ignore_input_low1:
    sbis 0x16, 3;
    rjmp ignore_input_low1;

;2
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low2;
    sbis 0x16, 3;
    rjmp ignore_input_low2;
    cbr r23, 64;
ignore_t1h_2:
    sbic 0x16, 3;
    rjmp ignore_t1h_2;
ignore_input_low2:
    sbis 0x16, 3;
    rjmp ignore_input_low2;

;3
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low3;
    sbis 0x16, 3;
    rjmp ignore_input_low3;
    cbr r23, 32;
ignore_t1h_3:
    sbic 0x16, 3;
    rjmp ignore_t1h_3;
ignore_input_low3:
    sbis 0x16, 3;
    rjmp ignore_input_low3;

;4
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low4;
    sbis 0x16, 3;
    rjmp ignore_input_low4;
    cbr r23, 16;
ignore_t1h_4:
    sbic 0x16, 3;
    rjmp ignore_t1h_4;
ignore_input_low4:
    sbis 0x16, 3;
    rjmp ignore_input_low4;

;5
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low5;
    sbis 0x16, 3;
    rjmp ignore_input_low5;
    cbr r23, 8;
ignore_t1h_5:
    sbic 0x16, 3;
    rjmp ignore_t1h_5;
ignore_input_low5:
    sbis 0x16, 3;
    rjmp ignore_input_low5;

;6
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low6;
    sbis 0x16, 3;
    rjmp ignore_input_low6;
    cbr r23, 4;
ignore_t1h_6:
    sbic 0x16, 3;
    rjmp ignore_t1h_6;
ignore_input_low6:
    sbis 0x16, 3;
    rjmp ignore_input_low6;

;7
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low7;
    sbis 0x16, 3;
    rjmp ignore_input_low7;
    cbr r23, 2;
ignore_t1h_7:
    sbic 0x16, 3;
    rjmp ignore_t1h_7;
ignore_input_low7:
    sbis 0x16, 3;
    rjmp ignore_input_low7;

;8
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low8;
    sbis 0x16, 3;
    rjmp ignore_input_low8;
    cbr r23, 1;
ignore_t1h_8:
    sbic 0x16, 3;
    rjmp ignore_t1h_8;
ignore_input_low8:
    sbis 0x16, 3;
    rjmp ignore_input_low8;

;9
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low9;
    sbis 0x16, 3;
    rjmp ignore_input_low9;
    cbr r24, 128;
ignore_t1h_9:
    sbic 0x16, 3;
    rjmp ignore_t1h_9;
ignore_input_low9:
    sbis 0x16, 3;
    rjmp ignore_input_low9;

;10
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low10;
    sbis 0x16, 3;
    rjmp ignore_input_low10;
    cbr r24, 64;
ignore_t1h_10:
    sbic 0x16, 3;
    rjmp ignore_t1h_10;
ignore_input_low10:
    sbis 0x16, 3;
    rjmp ignore_input_low10;

;11
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low11;
    sbis 0x16, 3;
    rjmp ignore_input_low11;
    cbr r24, 32;
ignore_t1h_11:
    sbic 0x16, 3;
    rjmp ignore_t1h_11;
ignore_input_low11:
    sbis 0x16, 3;
    rjmp ignore_input_low11;

;12
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low12;
    sbis 0x16, 3;
    rjmp ignore_input_low12;
    cbr r24, 16;
ignore_t1h_12:
    sbic 0x16, 3;
    rjmp ignore_t1h_12;
ignore_input_low12:
    sbis 0x16, 3;
    rjmp ignore_input_low12;

;13
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low13;
    sbis 0x16, 3;
    rjmp ignore_input_low13;
    cbr r24, 8;
ignore_t1h_13:
    sbic 0x16, 3;
    rjmp ignore_t1h_13;
ignore_input_low13:
    sbis 0x16, 3;
    rjmp ignore_input_low13;

;14
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low14;
    sbis 0x16, 3;
    rjmp ignore_input_low14;
    cbr r24, 4;
ignore_t1h_14:
    sbic 0x16, 3;
    rjmp ignore_t1h_14;
ignore_input_low14:
    sbis 0x16, 3;
    rjmp ignore_input_low14;

;15
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low15;
    sbis 0x16, 3;
    rjmp ignore_input_low15;
    cbr r24, 2;
ignore_t1h_15:
    sbic 0x16, 3;
    rjmp ignore_t1h_15;
ignore_input_low15:
    sbis 0x16, 3;
    rjmp ignore_input_low15;

;16
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low16;
    sbis 0x16, 3;
    rjmp ignore_input_low16;
    cbr r24, 1;
ignore_t1h_16:
    sbic 0x16, 3;
    rjmp ignore_t1h_16;
ignore_input_low16:
    sbis 0x16, 3;
    rjmp ignore_input_low16;

;17
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low17;
    sbis 0x16, 3;
    rjmp ignore_input_low17;
    cbr r25, 128;
ignore_t1h_17:
    sbic 0x16, 3;
    rjmp ignore_t1h_17;
ignore_input_low17:
    sbis 0x16, 3;
    rjmp ignore_input_low17;

;18
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low18;
    sbis 0x16, 3;
    rjmp ignore_input_low18;
    cbr r25, 64;
ignore_t1h_18:
    sbic 0x16, 3;
    rjmp ignore_t1h_18;
ignore_input_low18:
    sbis 0x16, 3;
    rjmp ignore_input_low18;

;19
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low19;
    sbis 0x16, 3;
    rjmp ignore_input_low19;
    cbr r25, 32;
ignore_t1h_19:
    sbic 0x16, 3;
    rjmp ignore_t1h_19;
ignore_input_low19:
    sbis 0x16, 3;
    rjmp ignore_input_low19;

;20
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low20;
    sbis 0x16, 3;
    rjmp ignore_input_low20;
    cbr r25, 16;
ignore_t1h_20:
    sbic 0x16, 3;
    rjmp ignore_t1h_20;
ignore_input_low20:
    sbis 0x16, 3;
    rjmp ignore_input_low20;

;21
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low21;
    sbis 0x16, 3;
    rjmp ignore_input_low21;
    cbr r25, 8;
ignore_t1h_21:
    sbic 0x16, 3;
    rjmp ignore_t1h_21;
ignore_input_low21:
    sbis 0x16, 3;
    rjmp ignore_input_low21;

;22
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low22;
    sbis 0x16, 3;
    rjmp ignore_input_low22;
    cbr r25, 4;
ignore_t1h_22:
    sbic 0x16, 3;
    rjmp ignore_t1h_22;
ignore_input_low22:
    sbis 0x16, 3;
    rjmp ignore_input_low22;

;23
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low23;
    sbis 0x16, 3;
    rjmp ignore_input_low23;
    cbr r25, 2;
ignore_t1h_23:
    sbic 0x16, 3;
    rjmp ignore_t1h_23;
ignore_input_low23:
    sbis 0x16, 3;
    rjmp ignore_input_low23;

;24
    nop;
    nop;
    sbis 0x16, 3;
    rjmp ignore_input_low24;
    sbis 0x16, 3;
    rjmp ignore_input_low24;
    cbr r25, 1;
ignore_t1h_24:
    sbic 0x16, 3;
    rjmp ignore_t1h_24;
ignore_input_low24:
    sbis 0x16, 3;
    rjmp ignore_input_low24;


/* T0H is 5clk, T1H is 10clk */
pass_through:
; T0H
    sbi 0x18, 2       ; 2clk
    nop;
    sbis 0x16, 3; 1+clk
    cbi 0x18, 2;  2clk
    sbis 0x16, 3; 1+clk
    cbi 0x18, 2;  2clk
    sbis 0x16, 3; 1+clk
    rjmp input_is_low_pre; 2clk
    
    cbi 0x18, 2; clear output
    sbis 0x16, 3;
    rjmp input_is_low;
    sbis 0x16, 3;
    rjmp input_is_low;
    sbis 0x16, 3;
    rjmp input_is_low;
    sbis 0x16, 3;
    rjmp input_is_low;
input_is_low_pre:
    cbi 0x18, 2;  2clk
input_is_low:
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    sbic 0x16, 3;
    rjmp pass_through;
    rjmp write_pwm;
    

/*
  r23: G
  r24: B
  r25: R
*/
write_pwm:
    push r25;
    push r24;
    ;mov r8, r25;
    ;mov r7, r24;
    /* analogWrite(PIN_0, 2);*/
    ldi r25, 0;
    ldi r24, 0;
    mov r22,r23;
    ldi r23, 0;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, 1;
    pop r22;
    ;mov r22, r7;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, 4;
    pop r22;
    ;mov r22, r8;
    rcall analogWrite;

    
wait_prepare:
    ser r23;
    ser r24;
    ser r25;
    ldi r18, 1;
    clr r16;
    clr r20;
    clc;
wait:
    sbic 0x16, 3;
    rjmp ignore;
    rjmp wait;
.endfunc
