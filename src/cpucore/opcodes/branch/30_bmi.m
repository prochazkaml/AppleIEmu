%#incdefs "src/cpucore/microcode/flags/definitions.txt"

if(bitand(p, __NEGATIVE_FLAG) == __NEGATIVE_FLAG)
%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc
%#incfun "src/cpucore/microcode/insn/bra.m" ~ = tmp8
else
	pc = pc + 1;
end
