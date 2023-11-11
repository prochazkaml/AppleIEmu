% Pops a 16 bit value from the stack.
% __ret1 = popped value

tmp16 = uint16(s) + 0x101;

%#incfun "src/cpucore/microcode/memory/getword.m" __ret1 = tmp16

s = s + 0x2;
