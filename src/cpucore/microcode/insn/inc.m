% Implements the INC instruction.

% __ret1 = return value
% __arg1 = source data

tmp16_2 = int16(__arg1) + int16(1);

if(tmp16_2 >= int16(0x100))
	tmp16_2 = tmp16_2 - int16(0x100);
end

__ret1 = uint8(tmp16_2);

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
