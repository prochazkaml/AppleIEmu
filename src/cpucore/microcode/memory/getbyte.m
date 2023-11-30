% __arg1 = source address
% __ret1 = destination

if(__arg1 >= 0x0000 && __arg1 < 0xC000) % Main system memory
	__ret1 = sysmem(__arg1 + 1);
elseif(__arg1 >= 0xF000 && __arg1 < 0x10000) % Apple system ROM
	__ret1 = applerom(__arg1 - 0xEFFF); % __arg1 - 0xF000 + 1
elseif(__arg1 == 0xD010) % KBD data register
	if(keybuf == 0x00)
		__ret1 = 0x00;
	else
		__ret1 = keybuf;
		keybuf = 0x00;
	end
elseif(__arg1 == 0xD011) % KBD control register
	if(keybuf == 0x00)
		__ret1 = 0x00; % No key pressed
	else
		__ret1 = 0x80; % Key pressed
	end
elseif(__arg1 == 0xD012) % DSP data register
	__ret1 = 0x00; % Pretend that all characters have been output
elseif(__arg1 == 0xD013) % DSP
	__ret1 = 0x00; % Do nothing
else
	EmuErrorHandler(sprintf("ERROR - INVALID MEMORY BYTE READ FROM %04X\n", __arg1), TerminalLabels);
end
