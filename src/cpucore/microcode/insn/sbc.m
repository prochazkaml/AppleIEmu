% Implements the SBC instruction.

% __ret1 = return value
% __arg1 = source data

%#incdefs "src/cpucore/microcode/flags/definitions.txt"

tmp16_2 = uint16(__ret1) + uint16(0xFF - __arg1) + uint16(bitand(p, __CARRY_FLAG));

if(tmp16_2 >= 0x100) % Carry flag (bit 0) set if overflow
	tmp16_2 = bitand(tmp16_2, 0x00FF);
	SET_CARRY_FLAG;
else
	CLR_CARRY_FLAG;
end

% Calculate overflow flag

if(bitand(bitand(bitxor(__ret1, uint8(tmp16_2)), bitxor(0xFF - __arg1, uint8(tmp16_2))), 0x80) ~= 0)
	SET_OVERFLOW_FLAG;
else
	CLR_OVERFLOW_FLAG;
end

__ret1 = uint8(tmp16_2);

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
