function UpdateProfiler(profiledata, figure)
	global profilerrunning;

	if profilerrunning == 0
		return
	end

	global profilerperiod;

	interval = 1:profilerperiod;
	
	if length(profiledata) < profilerperiod
		plot(figure, interval, [zeros(1, profilerperiod - length(profiledata)), profiledata]);
	else
		plot(figure, interval, profiledata(end-profilerperiod+1:end));
	end
end

function ProfilePauseButtonPushed(button, event)
	global profilerrunning;

	if profilerrunning == 0
		profilerrunning = 1;
		button.Text = 'Pause profiler';
	else
		profilerrunning = 0;
		button.Text = 'Unpause profiler';
	end
end
