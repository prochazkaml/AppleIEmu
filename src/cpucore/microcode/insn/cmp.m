% Implements the CMP instruction.

% __arg1 = data to compare against
% __arg2 = source data

tmps16 = int16(__arg1) - int16(__arg2);

if(tmps16 < int16(0x0000)) % Carry flag (bit 0) set if *not* overflow
	tmps16 = tmps16 + int16(0x100);
	CLEAR_CARRY_FLAG;
else
	SET_CARRY_FLAG;
end

tmp8 = uint8(tmps16);

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = tmp8
