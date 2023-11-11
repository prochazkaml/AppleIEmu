% Implements the ASL instruction.

% __ret1 = return value
% __arg1 = source data

if(__arg1 >= 0x80)
	__ret1 = (__arg1 - 0x80) * 0x2;
	SET_CARRY_FLAG;
else
	__ret1 = __arg1 * 0x2;
	CLEAR_CARRY_FLAG;
end

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
