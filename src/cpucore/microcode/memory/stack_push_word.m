% Pushes a 16 bit value onto the stack.
% __arg1 = value to push

tmp16 = uint16(s) + 0x100;
tmp8 = (__arg1 - 0x0080) / 0x100;

%#incfun "src/cpucore/microcode/memory/setbyte.m" ~ = tmp16 tmp8

tmp16 = tmp16 - 0x0001;
tmp8 = bitand(__arg1, uint16(0xFF));

%#incfun "src/cpucore/microcode/memory/setbyte.m" ~ = tmp16 tmp8

s = s - 0x2;
