if shouldsave
	labelstrings = cell(27, 1);

	for i = 1:27
		labelstrings{i} = TerminalLabels{i}.Text;
	end


	uisave({'sysmem','a','x','y','pc','p','s','labelstrings'});
	shouldsave = 0;
end

if shouldload
	uiload();

	for i = 1:27
		TerminalLabels{i}.Text = labelstrings{i};
	end

	shouldload = 0;
end

