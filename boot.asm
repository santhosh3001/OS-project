[org 0x7c00]

start:
    mov si, message

print_msg:
    lodsb
    cmp al, 0
    je input
    mov ah, 0x0e
    int 0x10
    jmp print_msg

input:
    mov ah, 0x00
    int 0x16

    cmp al, 13        ; Enter key
    je newline

    mov ah, 0x0e
    int 0x10
    jmp input

newline:
    mov ah, 0x0e
    mov al, 0x0D      ; carriage return
    int 0x10
    mov al, 0x0A      ; line feed
    int 0x10
    jmp input

message db "Welcome to My OS", 0x0D, 0x0A, "Type something: ", 0

times 510-($-$$) db 0
dw 0xaa55