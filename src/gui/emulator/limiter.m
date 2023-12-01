val = EmulatorCpuSpeedKnob.Value;

if val ~= 100
	if val == 0
		cpulimiterlasttoc = toc;
		continue;
	elseif (toc - 1 / val) >= cpulimiterlasttoc
		cpulimiterlasttoc = cpulimiterlasttoc + 1 / val;
	else
		continue;
	end
end
