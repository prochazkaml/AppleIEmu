% __ret1 = calculated 16 bit address

%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc

__ret1 = bitand(uint16(tmp8) + uint16(x), 0x00FF);

%#incfun "src/cpucore/microcode/memory/getword.m" __ret1 = __ret1

pc = pc + 1;
