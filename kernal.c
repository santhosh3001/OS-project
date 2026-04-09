void print(char *str) {
    while (*str) {
        asm volatile (
            "mov ah, 0x0e\n"
            "mov al, %0\n"
            "int 0x10"
            :
            : "r"(*str)
        );
        str++;
    }
}

char input;

void main() {
    print("Welcome to My OS\r\n");
    print("Type something: ");

    while (1) {
        asm volatile (
            "mov ah, 0x00\n"
            "int 0x16\n"
            "mov %0, al"
            : "=r"(input)
        );

        asm volatile (
            "mov ah, 0x0e\n"
            "mov al, %0\n"
            "int 0x10"
            :
            : "r"(input)
        );
    }
}