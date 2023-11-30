function EmulatorResetButtonPushed(src, event)
	global shouldreset;
	shouldreset = 1;
end

function EmuErrorHandler(errmsg, lbl)
	chars = uint8(convertStringsToChars(sprintf("\r\r****************************************6502 CPU EMULATOR EXCEPTION:\r%s\r****************************************", errmsg)));

	for c = chars
		WriteTerminal(c, lbl);
	end

	global shouldreset;
	shouldreset = 1;
end
