% __ret1 = calculated 16 bit address

%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc

__ret1 = bitand(uint16(tmp8) + uint16(y), 0x00FF);

pc = pc + 1;
