org 0x7c00
bits 16
prep:
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00
jmp start

; FUNCTIONS

; print
; shows text to screen
; requires : si
; returns : nothing

print:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
.loop:
    lodsb
    cmp al, 0
    je .finish
    mov ah, 0x0E
    int 0x10
    jmp .loop
.finish:
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; VARIABLES

; msg containing "Hello, World!" with the zero at the end

msg: db "Hello, World!", 0

;boot_drive containing the value of the bootable drive

boot_drive: db 0

start:
mov [boot_drive], dl
mov si, msg
jmp $
times 510-($-$$) db 0
dw 0xAA55