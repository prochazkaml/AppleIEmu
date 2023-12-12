if (toc - .1) >= emulatoruilasttoc
	emulatoruilasttoc = emulatoruilasttoc + .1;
	emulatorcpuspeed = EmulatorCpuSpeedKnob.Value;
	emulatordebugger = EmulatorDebuggerKnob.Value == "On";
end

if emulatorcpuspeed ~= 100
	if emulatorcpuspeed == 0
		cpulimiterlasttoc = toc;

		if ~shouldstep
			continue;
		end

		shouldstep = 0;
	elseif (toc - 1 / emulatorcpuspeed) >= cpulimiterlasttoc
		cpulimiterlasttoc = cpulimiterlasttoc + 1 / emulatorcpuspeed;
	else
		continue;
	end
end
