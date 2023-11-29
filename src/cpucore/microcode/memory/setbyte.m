% __arg1 = destination address
% __arg2 = data to write (MUST BE UINT8!!!)

if(__arg1 >= 0x0000 && __arg1 < 0x8000) % Main system memory
	sysmem(__arg1 + 1) = __arg2;
elseif(__arg1 == 0xD012) % DSP data register
	WriteTerminal(__arg2, TerminalLabels);
elseif(__arg1 == 0xD011 || __arg1 == 0xD013) % DSP/KBD control register
	% Do nothing
else
	error("ERROR - INVALID MEMORY BYTE WRITE TO %04X: %02X\n", __arg1, __arg2)
end
