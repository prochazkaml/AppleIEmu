% Implements the ADC instruction.

% __ret1 = return value
% __arg1 = source data

%#incdefs "src/cpucore/microcode/flags/definitions.txt"

tmp16 = uint16(__ret1) + uint16(__arg1) + uint16(bitand(p, __CARRY_FLAG));

if(tmp16 >= 0x100) % Carry flag (bit 0) set if overflow
	tmp = bitand(tmp, 0x00FF);
	SET_CARRY_FLAG;
else
	CLEAR_CARRY_FLAG;
end

% TODO - overflow flag

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
