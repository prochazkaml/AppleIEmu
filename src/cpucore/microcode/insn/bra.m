% Implements the behaviour of 6502 branch instruction.

% __arg1 = jump offset

if(__arg1 >= 0x80)
	tmp32 = int32(int32(__arg1) - int32(0x100));
else
	tmp32 = int32(__arg1);
end

pc = uint16(int32(pc) + tmp32);
