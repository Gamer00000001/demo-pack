asm=nasm

src=src
bin=bin

$(bin)/floppy.img: $(bin)/Bootloader/main.bin
	cp $(bin)/Bootloader/main.bin $(bin)/floppy.img
	truncate -s 1440k $(bin)/floppy.img

$(bin)/Bootloader/main.bin: $(src)/Bootloader/main.asm
	nasm $(src)/Bootloader/main.asm -f bin -o $(bin)/Bootloader/main.bin