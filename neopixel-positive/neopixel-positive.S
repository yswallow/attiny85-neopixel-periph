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
    ldi r18, 1;
    sbi 0x17, 0;
    sbi 0x17, 1;
    sbi 0x17,2 ; set B2 as output
    cbi 0x17,3 ; set B3 as input

    sbi 0x18, 0;
    cbi 0x18, 2;
    sbi 0x18, 1;
    rjmp wait_prepare;
    
ignore:
ignore_input_high1:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high1;
    cpi r20, 3;
    brmi ignore_input_low1_pre;
    sbr r23, 7;
ignore_input_low1_pre:
    clr r20;
ignore_input_low1:
    sbis 0x16, 3;
    rjmp ignore_input_low1;
    
ignore_input_high2:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high2;
    cpi r20, 3;
    brmi ignore_input_low2_pre;
    sbr r23, 6;
ignore_input_low2_pre:
    clr r20;
ignore_input_low2:
    sbis 0x16, 3;
    rjmp ignore_input_low2;
    
ignore_input_high3:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high3;
    cpi r20, 3;
    brmi ignore_input_low_pre3;
    sbr r23, 5;
ignore_input_low_pre3:
    clr r20;
ignore_input_low3:
    sbis 0x16, 3;
    rjmp ignore_input_low3;
    
ignore_input_high4:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high4;
    cpi r20, 3;
    brmi ignore_input_low_pre4;
    sbr r23, 4;
ignore_input_low_pre4:
    clr r20;
ignore_input_low4:
    sbis 0x16, 3;
    rjmp ignore_input_low4;
    
ignore_input_high5:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high5;
    cpi r20, 3;
    brmi ignore_input_low_pre5;
    sbr r23, 3;
ignore_input_low_pre5:
    clr r20;
ignore_input_low5:
    sbis 0x16, 3;
    rjmp ignore_input_low5;
    
ignore_input_high6:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high6;
    cpi r20, 3;
    brmi ignore_input_low_pre6;
    sbr r23, 2;
ignore_input_low_pre6:
    clr r20;
ignore_input_low6:
    sbis 0x16, 3;
    rjmp ignore_input_low6;
    
ignore_input_high7:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high7;
    cpi r20, 3;
    brmi ignore_input_low_pre7;
    sbr r23, 1;
ignore_input_low_pre7:
    clr r20;
ignore_input_low7:
    sbis 0x16, 3;
    rjmp ignore_input_low7;
    
ignore_input_high8:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high8;
    cpi r20, 3;
    brmi ignore_input_low_pre8;
    sbr r23, 0;
ignore_input_low_pre8:
    clr r20;
ignore_input_low8:
    sbis 0x16, 3;
    rjmp ignore_input_low8;
    
ignore_input_high9:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high9;
    cpi r20, 3;
    brmi ignore_input_low_pre9;
    sbr r24, 7;
ignore_input_low_pre9:
    clr r20;
ignore_input_low9:
    sbis 0x16, 3;
    rjmp ignore_input_low9;
    
ignore_input_high10:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high10;
    cpi r20, 3;
    brmi ignore_input_low_pre10;
    sbr r24, 6;
ignore_input_low_pre10:
    clr r20;
ignore_input_low10:
    sbis 0x16, 3;
    rjmp ignore_input_low10;
    
ignore_input_high11:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high11;
    cpi r20, 3;
    brmi ignore_input_low_pre11;
    sbr r24, 5;
ignore_input_low_pre11:
    clr r20;
ignore_input_low11:
    sbis 0x16, 3;
    rjmp ignore_input_low11;
    
ignore_input_high12:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high12;
    cpi r20, 3;
    brmi ignore_input_low_pre12;
    sbr r24, 4;
ignore_input_low_pre12:
    clr r20;
ignore_input_low12:
    sbis 0x16, 3;
    rjmp ignore_input_low12;
    
ignore_input_high13:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high13;
    cpi r20, 3;
    brmi ignore_input_low_pre13;
    sbr r24, 3;
ignore_input_low_pre13:
    clr r20;
ignore_input_low13:
    sbis 0x16, 3;
    rjmp ignore_input_low13;
    
ignore_input_high14:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high14;
    cpi r20, 3;
    brmi ignore_input_low_pre14;
    sbr r24, 2;
ignore_input_low_pre14:
    clr r20;
ignore_input_low14:
    sbis 0x16, 3;
    rjmp ignore_input_low14;
    
ignore_input_high15:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high15;
    cpi r20, 3;
    brmi ignore_input_low_pre15;
    sbr r24, 1;
ignore_input_low_pre15:
    clr r20;
ignore_input_low15:
    sbis 0x16, 3;
    rjmp ignore_input_low15;

ignore_input_high16:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high16;
    cpi r20, 3;
    brmi ignore_input_low_pre16;
    sbr r24, 0;
ignore_input_low_pre16:
    clr r20;
ignore_input_low16:
    sbis 0x16, 3;
    rjmp ignore_input_low16;
    
ignore_input_high17:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high17;
    cpi r20, 3;
    brmi ignore_input_low_pre17;
    sbr r25, 7;
ignore_input_low_pre17:
    clr r20;
ignore_input_low17:
    sbis 0x16, 3;
    rjmp ignore_input_low17;
    
ignore_input_high18:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high18;
    cpi r20, 3;
    brmi ignore_input_low_pre18;
    sbr r25, 6;
ignore_input_low_pre18:
    clr r20;
ignore_input_low18:
    sbis 0x16, 3;
    rjmp ignore_input_low18;

ignore_input_high19:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high19;
    cpi r20, 3;
    brmi ignore_input_low_pre19;
    sbr r25, 5;
ignore_input_low_pre19:
    clr r20;
ignore_input_low19:
    sbis 0x16, 3;
    rjmp ignore_input_low19;
    
ignore_input_high20:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high20;
    cpi r20, 3;
    brmi ignore_input_low_pre20;
    sbr r25, 4;
ignore_input_low_pre20:
    clr r20;
ignore_input_low20:
    sbis 0x16, 3;
    rjmp ignore_input_low20;
    
ignore_input_high21:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high21;
    cpi r20, 3;
    brmi ignore_input_low_pre21;
    sbr r25, 3;
ignore_input_low_pre21:
    clr r20;
ignore_input_low21:
    sbis 0x16, 3;
    rjmp ignore_input_low21;
    
ignore_input_high22:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high22;
    cpi r20, 3;
    brmi ignore_input_low_pre22;
    sbr r25, 2;
ignore_input_low_pre22:
    clr r20;
ignore_input_low22:
    sbis 0x16, 3;
    rjmp ignore_input_low22;
    
ignore_input_high23:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high23;
    cpi r20, 3;
    brmi ignore_input_low_pre23;
    sbr r25, 1;
ignore_input_low_pre23:
    clr r20;
ignore_input_low23:
    sbis 0x16, 3;
    rjmp ignore_input_low23;
    
ignore_input_high24:
    inc r20;
    sbic 0x16, 3;
    rjmp ignore_input_high24;
    cpi r20, 3;
    brmi ignore_input_low_pre24;
    sbr r25, 0;
ignore_input_low_pre24:
    clr r20;
ignore_input_low24:
    sbis 0x16, 3;
    rjmp ignore_input_low24;

pass_through:
    sbi 0x18, 2;
input_is_high:
    sbic 0x16, 3;
    rjmp input_is_high;
    cbi 0x18, 2; clear output
    clr r17;
input_is_low:
    add r17, r18;
    brcs write_pwm;
    sbis 0x16, 3;
    rjmp input_is_low;
    sbi 0x18, 2; set output
    rjmp input_is_high;

/*
  r23: G
  r24: B
  r25: R
*/
write_pwm:
    ;push r25;
    ;push r24;
    mov r8, r25;
    mov r7, r24;
    /* analogWrite(PIN_0, 2);*/
    ldi r25, 0;
    ldi r24, 0;
    mov r22,r23;
    ldi r23, 0;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, 1;
    ;pop r22;
    mov r22, r7;
    rcall analogWrite;

    ldi r25, 0;
    ldi r23, 0;
    ldi r24, 4;
    ;pop r22;
    mov r22, r8;
    rcall analogWrite;

    
wait_prepare:
    clr r23;
    clr r24;
    clr r25;
    ldi r18, 1;
    clr r16;
    clr r20;
    clc;
wait:
    sbic 0x16, 3;
    rjmp ignore;
    rjmp wait;
.endfunc
