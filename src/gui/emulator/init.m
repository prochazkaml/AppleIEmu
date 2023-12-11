% Create EmulatorTab
EmulatorTab = uitab(TabGroup);
EmulatorTab.AutoResizeChildren = 'off';
EmulatorTab.Title = 'Emulator';

% Create EmulatorTabGridLayout
EmulatorTabGridLayout = uigridlayout(EmulatorTab);
EmulatorTabGridLayout.ColumnWidth = {'1x', 150};
EmulatorTabGridLayout.RowHeight = {'1x'};

% Create EmulatorTabTerminalLayout
EmulatorTabTerminalLayout = uigridlayout(EmulatorTabGridLayout);
EmulatorTabTerminalLayout.ColumnWidth = {'1x'};
EmulatorTabTerminalLayout.RowHeight = {25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, '1x'};
EmulatorTabTerminalLayout.ColumnSpacing = 0;
EmulatorTabTerminalLayout.RowSpacing = 0;
EmulatorTabTerminalLayout.Padding = [0 0 0 0];
EmulatorTabTerminalLayout.Layout.Row = 1;
EmulatorTabTerminalLayout.Layout.Column = 1;
EmulatorTabTerminalLayout.Scrollable = 'on';
EmulatorTabTerminalLayout.BackgroundColor = [0 0 0];

% Create EmulatorControlsLayout
EmulatorControlsLayout = uigridlayout(EmulatorTabGridLayout);
EmulatorControlsLayout.ColumnWidth = {'1x'};
EmulatorControlsLayout.RowHeight = {125, 25, 125, 25, '1x', 50, 50};
EmulatorControlsLayout.Padding = [0 0 0 0];
EmulatorControlsLayout.Layout.Row = 1;
EmulatorControlsLayout.Layout.Column = 2;

% Create DebuggerKnobLabel
DebuggerKnobLabel = uilabel(EmulatorControlsLayout);
DebuggerKnobLabel.HorizontalAlignment = 'center';
DebuggerKnobLabel.Layout.Row = 2;
DebuggerKnobLabel.Layout.Column = 1;
DebuggerKnobLabel.Text = 'Debugger';

% Create EmulatorDebuggerKnob
EmulatorDebuggerKnob = uiknob(EmulatorControlsLayout, 'discrete');
EmulatorDebuggerKnob.Items = {'Off', 'On'};
EmulatorDebuggerKnob.Layout.Row = 1;
EmulatorDebuggerKnob.Layout.Column = 1;

% Create EmulatorCpuSpeedKnob
EmulatorCpuSpeedKnob = uiknob(EmulatorControlsLayout, 'continuous');
EmulatorCpuSpeedKnob.Limits = [0 100];
EmulatorCpuSpeedKnob.Layout.Row = 3;
EmulatorCpuSpeedKnob.Layout.Column = 1;
EmulatorCpuSpeedKnob.Value = 100;

cpulimiterlasttoc = 0;

% Create CPUspeedKnobLabel
CPUspeedKnobLabel = uilabel(EmulatorControlsLayout);
CPUspeedKnobLabel.HorizontalAlignment = 'center';
CPUspeedKnobLabel.Layout.Row = 4;
CPUspeedKnobLabel.Layout.Column = 1;
CPUspeedKnobLabel.Text = 'CPU speed';

% Create EmulatorStepButton
EmulatorStepButton = uibutton(EmulatorControlsLayout, 'push');
EmulatorStepButton.Layout.Row = 6;
EmulatorStepButton.Layout.Column = 1;
EmulatorStepButton.Text = 'SINGLE STEP';
EmulatorStepButton.Visible = 0;
EmulatorStepButton.ButtonPushedFcn = @EmulatorStepButtonPushed;

% Create EmulatorResetButton
EmulatorResetButton = uibutton(EmulatorControlsLayout, 'push');
EmulatorResetButton.BackgroundColor = [1 0 0];
EmulatorResetButton.FontColor = [1 1 1];
EmulatorResetButton.Layout.Row = 7;
EmulatorResetButton.Layout.Column = 1;
EmulatorResetButton.Text = 'RESET SYSTEM';
EmulatorResetButton.ButtonPushedFcn = @EmulatorResetButtonPushed;

global shouldreset;
shouldreset = 0;

global shouldstep;
shouldstep = 0;

EmulatorCpuSpeedKnob.ValueChangedFcn = @(src, event) EmulatorCheckSingleStepVisible(EmulatorStepButton, event.Value == 0);
