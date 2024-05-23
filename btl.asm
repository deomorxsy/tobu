; ==========
;
; starting a bootloader by shamelessly copying
; probably the most copied code in all story of
; bootloader development
;
; ==========

[bits 16]
; start of the segment
[org 0x7c00]

start:
    jmp boot

; constant and variables
msg db "dale", 0ah, 0dh, 0h

loop:
    jmp loop

boot:
    cli ; no interrupts
    cld ; needed to init
    hlt ; halt the system

; current instruction: $
; start of .text section: $$
; 512 bytes, clear the rest with 0
times 510 - ($-$$) db 0

vga_buffer:
    mov rsi 0xb8000

; boot signature (the magic number)
dw 0x5AAA
