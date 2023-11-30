% Create ProfilerTab
ProfilerTab = uitab(TabGroup);
ProfilerTab.Title = 'Profiler';

% Create ProfilerTabGridLayout
ProfilerTabGridLayout = uigridlayout(ProfilerTab);
ProfilerTabGridLayout.ColumnWidth = {'1x'};
ProfilerTabGridLayout.RowHeight = {'1x', 30};

% Create ProfilerFigure
ProfilerFigure = uiaxes(ProfilerTabGridLayout);
ylabel(ProfilerFigure, 'Executed instructions per second');
ylim(ProfilerFigure, [0 inf]);
ProfilerFigure.Toolbar.Visible = 'off';
ProfilerFigure.Layout.Row = 1;
ProfilerFigure.Layout.Column = 1;

% Create ProfilerTabControlsGridLayout
ProfilerTabControlsGridLayout = uigridlayout(ProfilerTabGridLayout);
ProfilerTabControlsGridLayout.ColumnWidth = {100, 100, '1x', 150, 150};
ProfilerTabControlsGridLayout.RowHeight = {'1x'};
ProfilerTabControlsGridLayout.Padding = [0 0 0 0];
ProfilerTabControlsGridLayout.Layout.Row = 2;
ProfilerTabControlsGridLayout.Layout.Column = 1;

% Create ResetProfilerButton
ResetProfilerButton = uibutton(ProfilerTabControlsGridLayout, 'push');
ResetProfilerButton.Layout.Row = 1;
ResetProfilerButton.Layout.Column = 5;
ResetProfilerButton.Text = 'Reset profiler';

% Create DisplaythelastDropDownLabel
DisplaythelastDropDownLabel = uilabel(ProfilerTabControlsGridLayout);
DisplaythelastDropDownLabel.HorizontalAlignment = 'right';
DisplaythelastDropDownLabel.Layout.Row = 1;
DisplaythelastDropDownLabel.Layout.Column = 1;
DisplaythelastDropDownLabel.Text = 'Display the last';

% Create ProfilerDurationDropDown
ProfilerDurationDropDown = uidropdown(ProfilerTabControlsGridLayout);
ProfilerDurationDropDown.ValueChangedFcn = @ProfilerDurationChanged;
ProfilerDurationDropDown.Items = {'5 seconds', '10 seconds', '30 seconds', '1 minute', '2 minutes', '5 minutes', '10 minutes', '30 minutes', '1 hour', 'everything'};
ProfilerDurationDropDown.Layout.Row = 1;
ProfilerDurationDropDown.Layout.Column = 2;
ProfilerDurationDropDown.Value = '30 seconds';

% Create PauseProfilerButton
PauseProfilerButton = uibutton(ProfilerTabControlsGridLayout, 'push');
PauseProfilerButton.ButtonPushedFcn = @ProfilerPauseButtonPushed;
PauseProfilerButton.Layout.Row = 1;
PauseProfilerButton.Layout.Column = 4;
PauseProfilerButton.Text = 'Pause profiler';

global profilerrunning;
profilerrunning = 1;

global profilerduration;
profilerduration = 30;
