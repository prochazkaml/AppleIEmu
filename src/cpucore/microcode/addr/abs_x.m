% __ret1 = calculated 16 bit address

%#incfun "src/cpucore/microcode/memory/getword.m" __ret1 = pc

__ret1 = __ret1 + uint16(y);

pc = pc + 2;
