.DELETE_ON_ERROR:

AS = asmx
ASFLAGS = -e -b -C 68k
PYTHON = python3

ASM = hack.asm
OBJ = hack.asm.bin
OUTPUT_ROM = hack.md
OBJS = $(OUTPUT_ROM) $(OBJ)

$(OUTPUT_ROM): fixchecksum.py $(OBJ)
	$(PYTHON) $<

$(OBJ): $(ASM)
	$(AS) $(ASFLAGS) $<

.PHONY: all clean test
clean:
	rm -rf $(OBJS)
