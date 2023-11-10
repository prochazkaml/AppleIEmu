% Pushes a value onto the stack.
% __arg1 = value to push

tmp16 = uint16(s) + 0x100;

%#incfun "src/cpucore/microcode/getbyte.m" tmp16 = __arg1

s = s - 1;
