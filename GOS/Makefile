asm=nasm

src=src
bin=bin

$(bin)/floppy.img: $(bin)/Bootloader/main.bin
	dd if=/dev/zero of=$(bin)/floppy.img bs=4096 count=360 --status=progress
	dd if=$(bin)/Bootloader/main.bin of=$(bin)/floppy.img

$(bin)/Bootloader/main.bin: $(src)/Bootloader/main.asm
	nasm $(src)/Bootloader/main.asm -f bin -o $(bin)/Bootloader/main.bin