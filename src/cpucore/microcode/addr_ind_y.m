% __ret1 = calculated 16 bit address

%#incfun "src/cpucore/microcode/getbyte.m" tmp8 = pc

__ret1 = uint16(tmp8);

%#incfun "src/cpucore/microcode/getword.m" __ret1 = __ret1

__ret1 = __ret1 + uint16(y);

pc = pc + 1;
