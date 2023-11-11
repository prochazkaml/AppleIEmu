% Implements the DEC instruction.

% __ret1 = return value
% __arg1 = source data

tmp16 = int16(__arg1) - int16(1);

if(tmp16 < int16(0x0000))
	tmp16 = tmp16 + int16(0x100);
end

__ret1 = uint8(tmp16);

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
