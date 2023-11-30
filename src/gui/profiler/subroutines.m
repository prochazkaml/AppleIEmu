function UpdateProfiler(profiledata, figure)
	global profilerrunning;

	if profilerrunning == 0
		return
	end

	global profilerduration;

	if profilerduration == 0 % 0 = plot everything
		plot(figure, 1:length(profiledata), profiledata);
		return
	end

	interval = 1:profilerduration;
	
	if length(profiledata) < profilerduration
		plot(figure, interval, [zeros(1, profilerduration - length(profiledata)), profiledata]);
	else
		plot(figure, interval, profiledata(end-profilerduration+1:end));
	end
end

function ProfilerDurationChanged(dropdown, event)
	global profilerduration;

	x = split(convertCharsToStrings(dropdown.Value), " ");

	if x(1) == "everything"
		profilerduration = 0;
		return
	end

	val = double(x(1));

	if startsWith(x(2), "minute")
		val = val * 60;
	end

	if startsWith(x(2), "hour")
		val = val * 3600;
	end

	profilerduration = val;
end

function ProfilerPauseButtonPushed(button, event)
	global profilerrunning;

	if profilerrunning == 0
		profilerrunning = 1;
		button.Text = 'Pause profiler';
	else
		profilerrunning = 0;
		button.Text = 'Unpause profiler';
	end
end
