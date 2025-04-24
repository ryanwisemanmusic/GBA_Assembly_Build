INCLUDE "hardware.inc"

SECTION "Header", ROM0[$100]
    jp EntryPoint
    ds $150 - @, 0

SECTION "Entry Point", ROM0[$150]
EntryPoint:
    ;This disables interrupts
    di 

    ;FFFE is the very top of the stack, we load this into the stack pointer
    ld sp, $FFFE
    
    ;We then call our first loop
    call WaitVBlank

    ld a, [$ff00+c]
    ldh [$ff00], a

.loop:
    halt
    nop 
    jr .loop

WaitVBlank:
    ldh a, [rLY]
    cp 144
    jr c, WaitVBlank
    ret
