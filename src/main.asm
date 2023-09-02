org 0x7C00
bits 16

%define ENDL 0x80, 0x0A
start:
    jmp main

puts:
    push si
    push ax

.loop:
    lodsb
    or al, al
    jz .done

    mov ah, 0x0e
    int 0x10
    
    jmp .loop

.done:
    pop ax
    pop si
    ret

main:
    ; Setting up Data Segment
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; Setting up Stack Segment
    mov ss, ax
    mov sp, 0x7C00

    mov si, msg_hello
    call puts

.halt:
    jmp .halt

msg_hello: db 'Hello World!', ENDL, 0

times 510 - ($ - $$) db 0
dw 0AA55h