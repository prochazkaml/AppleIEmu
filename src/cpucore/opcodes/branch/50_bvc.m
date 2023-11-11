%#incdefs "src/cpucore/microcode/flags/definitions.txt"

if(bitand(p, __OVERFLOW_FLAG) == 0x00)
%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc
%#incfun "src/cpucore/microcode/insn/bra.m" ~ = tmp8
else
	pc = pc + 1;
end
