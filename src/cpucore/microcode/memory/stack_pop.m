% Pops a value from the stack.
% __ret1 = popped value

if s == 0xFF
	s = 0x0;
else
	s = s + 0x1;
end

tmp16 = uint16(s) + 0x100;

%#incfun "src/cpucore/microcode/memory/getbyte.m" __ret1 = tmp16
