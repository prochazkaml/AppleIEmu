% Create EmulatorTab
EmulatorTab = uitab(TabGroup);
EmulatorTab.AutoResizeChildren = 'off';
EmulatorTab.Title = 'Emulator';

% Create GridLayout9
GridLayout9 = uigridlayout(EmulatorTab);
GridLayout9.ColumnWidth = {'1x'};
GridLayout9.RowHeight = {'1x', 0};
GridLayout9.ColumnSpacing = 0;
GridLayout9.RowSpacing = 0;
GridLayout9.Padding = [0 0 0 0];

% Create EmulatorTabGridLayout
EmulatorTabGridLayout = uigridlayout(GridLayout9);
EmulatorTabGridLayout.ColumnWidth = {'1x', 150};
EmulatorTabGridLayout.RowHeight = {'1x'};
EmulatorTabGridLayout.Layout.Row = 1;
EmulatorTabGridLayout.Layout.Column = 1;

% Create GridLayout10
GridLayout10 = uigridlayout(GridLayout9);
GridLayout10.ColumnWidth = {290, '1x', 500};
GridLayout10.RowHeight = {'1x'};
GridLayout10.Padding = [0 0 0 0];
GridLayout10.Layout.Row = 2;
GridLayout10.Layout.Column = 1;

% Create EmulatorBlinkenLightsLayout
EmulatorBlinkenLightsLayout = uigridlayout(GridLayout10);
EmulatorBlinkenLightsLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
EmulatorBlinkenLightsLayout.RowHeight = {'2x', '1x', '2x', '1x'};
EmulatorBlinkenLightsLayout.ColumnSpacing = 0;
EmulatorBlinkenLightsLayout.RowSpacing = 0;
EmulatorBlinkenLightsLayout.Padding = [0 0 0 0];
EmulatorBlinkenLightsLayout.Layout.Row = 1;
EmulatorBlinkenLightsLayout.Layout.Column = 3;

% Create address lamps

for i = 1:16
	DebuggerAddressLamps(i) = uilamp(EmulatorBlinkenLightsLayout);
	DebuggerAddressLamps(i).Layout.Row = 1;
	DebuggerAddressLamps(i).Layout.Column = 17 - i;
	DebuggerAddressLamps(i).Color = [0 0 0];

	lbl = uilabel(EmulatorBlinkenLightsLayout);
	lbl.HorizontalAlignment = 'center';
	lbl.Layout.Row = 2;
	lbl.Layout.Column = 17 - i;
	lbl.Text = horzcat('A', int2str(i - 1));
end

% Create opcode lamps

for i = 1:8
	DebuggerOpcodeLamps(i) = uilamp(EmulatorBlinkenLightsLayout);
	DebuggerOpcodeLamps(i).Layout.Row = 3;
	DebuggerOpcodeLamps(i).Layout.Column = 17 - i;
	DebuggerOpcodeLamps(i).Color = [0 0 0];

	lbl = uilabel(EmulatorBlinkenLightsLayout);
	lbl.HorizontalAlignment = 'center';
	lbl.Layout.Row = 4;
	lbl.Layout.Column = 17 - i;
	lbl.Text = horzcat('OP', int2str(i - 1));
end

% Create flags lamps

flags = 'NV-BDIZC';

for i = 1:8
	DebuggerFlagsLamps(i) = uilamp(EmulatorBlinkenLightsLayout);
	DebuggerFlagsLamps(i).Layout.Row = 3;
	DebuggerFlagsLamps(i).Layout.Column = 9 - i;
	DebuggerFlagsLamps(i).Color = [0 0 0];

	lbl = uilabel(EmulatorBlinkenLightsLayout);
	lbl.HorizontalAlignment = 'center';
	lbl.Layout.Row = 4;
	lbl.Layout.Column = 9 - i;
	lbl.Text = flags(9 - i);
end	

% Create EmulatorDebuggerLayout
EmulatorDebuggerLayout = uigridlayout(GridLayout10);
EmulatorDebuggerLayout.ColumnWidth = {'1x', '1x', '1x', '1x'};
EmulatorDebuggerLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x'};
EmulatorDebuggerLayout.RowSpacing = 0;
EmulatorDebuggerLayout.Padding = [0 0 0 0];
EmulatorDebuggerLayout.Layout.Row = 1;
EmulatorDebuggerLayout.Layout.Column = 1;

% Create debugger labels

debuglbls = [
	"PC", "A",
	"Opcode", "X",
	"Opcode+1", "Y",
	"Opcode+2", "SP",
	"", "Flags"
];

for i = 1:5
	lbl = uilabel(EmulatorDebuggerLayout);
	lbl.HorizontalAlignment = 'right';
	lbl.Layout.Row = i;
	lbl.Layout.Column = 1;
	lbl.Text = debuglbls(i, 1);

	DebuggerLabels(i) = uilabel(EmulatorDebuggerLayout);
	DebuggerLabels(i).HorizontalAlignment = 'left';
	DebuggerLabels(i).Layout.Row = i;
	DebuggerLabels(i).Layout.Column = 2;
	DebuggerLabels(i).Text = '--';
	DebuggerLabels(i).FontName = 'monospace';

	lbl = uilabel(EmulatorDebuggerLayout);
	lbl.HorizontalAlignment = 'right';
	lbl.Layout.Row = i;
	lbl.Layout.Column = 3;
	lbl.Text = debuglbls(i, 2);

	DebuggerLabels(i + 5) = uilabel(EmulatorDebuggerLayout);
	DebuggerLabels(i + 5).HorizontalAlignment = 'left';
	DebuggerLabels(i + 5).Layout.Row = i;
	DebuggerLabels(i + 5).Layout.Column = 4;
	DebuggerLabels(i + 5).Text = '--';
	DebuggerLabels(i + 5).FontName = 'monospace';
end	

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

emulatoruilasttoc = 0;
emulatorcpuspeed = 100;
emulatordebuggerlast = 0;
emulatordebugger = 0;
