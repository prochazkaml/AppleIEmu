% Implements the ADC instruction.

% __ret1 = return value
% __arg1 = source data

%#incdefs "src/cpucore/microcode/flags/definitions.txt"

tmp16_2 = uint16(__ret1) + uint16(__arg1) + uint16(bitand(p, __CARRY_FLAG));

if(tmp16_2 >= 0x100) % Carry flag (bit 0) set if overflow
	tmp16_2 = bitand(tmp16_2, 0x00FF);
	SET_CARRY_FLAG;
else
	CLR_CARRY_FLAG;
end

% TODO - overflow flag

__ret1 = uint8(tmp16_2);

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
