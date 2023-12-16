% Pushes a value onto the stack.
% __arg1 = value to push

tmp16 = uint16(s) + 0x100;

%#incfun "src/cpucore/microcode/memory/setbyte.m" ~ = tmp16 __arg1

if s == 0x0
	s = 0xFF;
else
	s = s - 0x1;
end
