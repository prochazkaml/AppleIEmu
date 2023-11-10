% __ret1 = calculated 16 bit address

%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = pc

__ret1 = uint16(tmp8);

pc = pc + 1;
