if (toc - 1) >= profilerlasttoc
	profilerlasttoc = profilerlasttoc + 1;

	% fprintf("Executed: %d\n", insns);

	if profilerreset == 1
		profileinsns = zeros(1);
		profilerreset = 0;
	end

	profileinsns(length(profileinsns) + 1) = insns;
	UpdateProfiler(profileinsns, ProfilerFigure);

	insns = 0;
end
