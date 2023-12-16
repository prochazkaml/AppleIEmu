function TerminalColourChange(redfg, greenfg, bluefg, redbg, greenbg, bluebg, textlamp, backlamp, termbg, termlbl)
	bg = [ ...
		redbg.Value / 100 ...
		greenbg.Value / 100 ...
		bluebg.Value / 100 ...
	];
	
	fg = [ ...
		redfg.Value / 100 ...
		greenfg.Value / 100 ...
		bluefg.Value / 100 ...
	];
	
	backlamp.Color = bg;
	textlamp.Color = fg;

	for i = 1:length(termlbl)
		termlbl{i}.FontColor = fg;
	end

	termbg.BackgroundColor = bg;
end