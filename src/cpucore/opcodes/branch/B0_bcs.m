%#incdefs "src/cpucore/microcode/flags/definitions.txt"

if(bitand(p, __CARRY_FLAG) == __CARRY_FLAG)
%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc
%#incfun "src/cpucore/microcode/insn/bra.m" ~ = tmp8
else
	pc = pc + 1;
end
