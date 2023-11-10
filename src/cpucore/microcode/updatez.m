% Updates the zero flag according to the result.
% __arg1 = the result of the last operation

%#incdefs "src/cpucore/microcode/definitions.txt"

if(__arg1 == 0x00) % Zero flag = bit 1
	SET_ZERO_FLAG;
else
	CLR_ZERO_FLAG;
end
