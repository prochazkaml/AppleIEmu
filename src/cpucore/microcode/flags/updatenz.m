% Updates the negative and zero flag according to the result.
% __arg1 = the result of the last operation

%#incdefs "src/cpucore/microcode/flags/definitions.txt"

if(__arg1 == 0x00) % Zero flag = bit 1
	SET_ZERO_FLAG;
else
	CLR_ZERO_FLAG;
end

if(bitand(__arg1, 0x80) == 0x80) % Negative flag = bit 7
	SET_NEGATIVE_FLAG;
else
	CLR_NEGATIVE_FLAG;
end
