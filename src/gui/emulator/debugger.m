if emulatordebugger ~= emulatordebuggerlast
	emulatordebuggerlast = emulatordebugger;
	
	if emulatordebugger == 1
		GridLayout9.RowHeight{2} = 100;
	else
		GridLayout9.RowHeight{2} = 0;
	end
end

if emulatordebugger == 1
	% Update debugger labels

	DebuggerLabels(1).Text = dec2hex(pc, 4);
	DebuggerLabels(6).Text = dec2hex(a, 2);
	DebuggerLabels(7).Text = dec2hex(x, 2);
	DebuggerLabels(8).Text = dec2hex(y, 2);
	DebuggerLabels(9).Text = dec2hex(s, 2);
	DebuggerLabels(10).Text = dec2hex(p, 2);

	tmp = pc;

%#incfun "src/cpucore/microcode/memory/getbytefast.m" opcode = tmp
	DebuggerLabels(2).Text = dec2hex(opcode, 2);

	tmp = tmp + 1;

%#incfun "src/cpucore/microcode/memory/getbytefast.m" opcode = tmp
	DebuggerLabels(3).Text = dec2hex(opcode, 2);

	tmp = tmp + 1;

%#incfun "src/cpucore/microcode/memory/getbytefast.m" opcode = tmp
	DebuggerLabels(4).Text = dec2hex(opcode, 2);

	% Update address blinkenlights

	for i = 1:16
		if bitand(pc, 2^(i-1)) ~= 0
			DebuggerAddressLamps(i).Color = [1 .5 0];
		else
			DebuggerAddressLamps(i).Color = [0 0 0];
		end
	end

	% Update flags blinkenlights

	for i = 1:8
		if bitand(p, 2^(i-1)) ~= 0
			DebuggerFlagsLamps(i).Color = [1 .5 0];
		else
			DebuggerFlagsLamps(i).Color = [0 0 0];
		end
	end

	% Update opcode blinkenlights

	for i = 1:8
		if bitand(b, 2^(i-1)) ~= 0
			DebuggerOpcodeLamps(i).Color = [1 .5 0];
		else
			DebuggerOpcodeLamps(i).Color = [0 0 0];
		end
	end
end
