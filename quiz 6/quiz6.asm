#include<p18f4550.inc>

loop_cnt set 0x00
loop_cnt1 set 0x01
loop_cnt2 set 0x02

		org 0x00
		goto start
		org 0x08
		retfie
		org 0x18
		retfie
		
light9	bsf PORTD,0,A
		bsf PORTD,1,A
		bsf PORTD,2,A
		bsf PORTD,5,A
		bsf PORTD,6,A
		return
		
light7	bsf PORTD,0,A
		bsf PORTD,1,A
		bsf PORTD,2,A
		return
		
light3	bsf PORTD,0,A
		bsf PORTD,1,A
		bsf PORTD,2,A
		bsf PORTD,3,A
		bsf PORTD,6,A
		return
		
offit	clrf PORTD,A
		return
		
dup_nop	macro kk
		variable i
i=0
		while i < kk
		nop
i+=1	
		endw
		endm
		
		
delay	MOVLW D'250'
		MOVWF loop_cnt2,A
again1	MOVLW D'20'
		MOVWF loop_cnt1,A
again2	dup_nop D'36'
		decfsz loop_cnt1,F,A
		bra again2
		decfsz loop_cnt2,F,A
		bra again1
		return 

start	clrf TRISD,A
		
loop	call light9
		call delay

		call light7
		call delay

		call light3
		call delay

		call light3
		call delay

		call light9
		call delay
		
		end
