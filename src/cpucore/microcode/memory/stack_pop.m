% Pops a value from the stack.
% __ret1 = popped value

s = s + 1;
tmp16 = uint16(s) + 0x100;

%#incfun "src/cpucore/microcode/memory/getbyte.m" __ret1 = tmp16
