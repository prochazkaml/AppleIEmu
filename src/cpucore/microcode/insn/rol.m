% Implements the ROL instruction.

% __ret1 = return value
% __arg1 = source data

%#incdefs "src/cpucore/microcode/flags/definitions.txt"

if(__arg1 >= 0x80)
	__ret1 = (__arg1 - 0x80) * 0x2 + bitand(p, __CARRY_FLAG);
	SET_CARRY_FLAG;
else
	__ret1 = __arg1 * 0x2 + bitand(p, __CARRY_FLAG);
	CLR_CARRY_FLAG;
end

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
