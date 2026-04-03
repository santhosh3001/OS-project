all:
	nasm -f bin boot.asm -o os.bin

run:
	qemu-system-x86_64 os.bin