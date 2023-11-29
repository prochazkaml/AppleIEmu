% Create TerminalAppearanceTab
TerminalAppearanceTab = uitab(SettingsSubtabGroup);
TerminalAppearanceTab.Title = 'Terminal arance';

% Create TerminalAppearanceGridLayout
TerminalAppearanceGridLayout = uigridlayout(TerminalAppearanceTab);
TerminalAppearanceGridLayout.RowHeight = {50, 150};
TerminalAppearanceGridLayout.Scrollable = 'on';

% Create TextColorLabel
TextColorLabel = uilabel(TerminalAppearanceGridLayout);
TextColorLabel.HorizontalAlignment = 'center';
TextColorLabel.FontSize = 24;
TextColorLabel.Layout.Row = 1;
TextColorLabel.Layout.Column = 1;
TextColorLabel.Text = 'Text colour';

% Create BackColorLabel
BackColorLabel = uilabel(TerminalAppearanceGridLayout);
BackColorLabel.HorizontalAlignment = 'center';
BackColorLabel.FontSize = 24;
BackColorLabel.Layout.Row = 1;
BackColorLabel.Layout.Column = 2;
BackColorLabel.Text = 'Background colour';

% Create TextColorGridLayout
TextColorGridLayout = uigridlayout(TerminalAppearanceGridLayout);
TextColorGridLayout.ColumnWidth = {'3x', '1x'};
TextColorGridLayout.RowHeight = {'1x'};
TextColorGridLayout.Padding = [0 0 0 0];
TextColorGridLayout.Layout.Row = 2;
TextColorGridLayout.Layout.Column = 1;

% Create TextColorSliderGridLayout
TextColorSliderGridLayout = uigridlayout(TextColorGridLayout);
TextColorSliderGridLayout.ColumnWidth = {60, '1x'};
TextColorSliderGridLayout.RowHeight = {'1x', '1x', '1x'};
TextColorSliderGridLayout.Padding = [0 0 0 0];
TextColorSliderGridLayout.Layout.Row = 1;
TextColorSliderGridLayout.Layout.Column = 1;

% Create GreenSliderLabel
GreenSliderLabel = uilabel(TextColorSliderGridLayout);
GreenSliderLabel.HorizontalAlignment = 'right';
GreenSliderLabel.Layout.Row = 2;
GreenSliderLabel.Layout.Column = 1;
GreenSliderLabel.Text = 'Green';

% Create TextGreenSlider
TextGreenSlider = uislider(TextColorSliderGridLayout);
TextGreenSlider.Layout.Row = 2;
TextGreenSlider.Layout.Column = 2;
TextGreenSlider.Value = 100;

% Create TextBlueSlider
TextBlueSlider = uislider(TextColorSliderGridLayout);
TextBlueSlider.Layout.Row = 3;
TextBlueSlider.Layout.Column = 2;

% Create BlueSliderLabel
BlueSliderLabel = uilabel(TextColorSliderGridLayout);
BlueSliderLabel.HorizontalAlignment = 'right';
BlueSliderLabel.Layout.Row = 3;
BlueSliderLabel.Layout.Column = 1;
BlueSliderLabel.Text = 'Blue';

% Create RedSliderLabel
RedSliderLabel = uilabel(TextColorSliderGridLayout);
RedSliderLabel.HorizontalAlignment = 'right';
RedSliderLabel.Layout.Row = 1;
RedSliderLabel.Layout.Column = 1;
RedSliderLabel.Text = 'Red';

% Create TextRedSlider
TextRedSlider = uislider(TextColorSliderGridLayout);
TextRedSlider.Layout.Row = 1;
TextRedSlider.Layout.Column = 2;

% Create TextLamp
TextLamp = uilamp(TextColorGridLayout);
TextLamp.Layout.Row = 1;
TextLamp.Layout.Column = 2;

% Create BackColorGridLayout
BackColorGridLayout = uigridlayout(TerminalAppearanceGridLayout);
BackColorGridLayout.ColumnWidth = {'3x', '1x'};
BackColorGridLayout.RowHeight = {'1x'};
BackColorGridLayout.Padding = [0 0 0 0];
BackColorGridLayout.Layout.Row = 2;
BackColorGridLayout.Layout.Column = 2;

% Create BackColorSliderGridLayout
BackColorSliderGridLayout = uigridlayout(BackColorGridLayout);
BackColorSliderGridLayout.ColumnWidth = {60, '1x'};
BackColorSliderGridLayout.RowHeight = {'1x', '1x', '1x'};
BackColorSliderGridLayout.Padding = [0 0 0 0];
BackColorSliderGridLayout.Layout.Row = 1;
BackColorSliderGridLayout.Layout.Column = 1;

% Create RedSlider_2Label
RedSlider_2Label = uilabel(BackColorSliderGridLayout);
RedSlider_2Label.HorizontalAlignment = 'right';
RedSlider_2Label.Layout.Row = 1;
RedSlider_2Label.Layout.Column = 1;
RedSlider_2Label.Text = 'Red';

% Create BackRedSlider
BackRedSlider = uislider(BackColorSliderGridLayout);
BackRedSlider.Layout.Row = 1;
BackRedSlider.Layout.Column = 2;

% Create GreenSlider_2Label
GreenSlider_2Label = uilabel(BackColorSliderGridLayout);
GreenSlider_2Label.HorizontalAlignment = 'right';
GreenSlider_2Label.Layout.Row = 2;
GreenSlider_2Label.Layout.Column = 1;
GreenSlider_2Label.Text = 'Green';

% Create BackGreenSlider
BackGreenSlider = uislider(BackColorSliderGridLayout);
BackGreenSlider.Layout.Row = 2;
BackGreenSlider.Layout.Column = 2;

% Create BlueSlider_2Label
BlueSlider_2Label = uilabel(BackColorSliderGridLayout);
BlueSlider_2Label.HorizontalAlignment = 'right';
BlueSlider_2Label.Layout.Row = 3;
BlueSlider_2Label.Layout.Column = 1;
BlueSlider_2Label.Text = 'Blue';

% Create BackBlueSlider
BackBlueSlider = uislider(BackColorSliderGridLayout);
BackBlueSlider.Layout.Row = 3;
BackBlueSlider.Layout.Column = 2;

% Create BackLamp
BackLamp = uilamp(BackColorGridLayout);
BackLamp.Layout.Row = 1;
BackLamp.Layout.Column = 2;
BackLamp.Color = [0 0 0];

% Make the colour sliders work
TerminalColourUpdateFun = @(src, event) TerminalColourChange(TextRedSlider, TextGreenSlider, TextBlueSlider, BackRedSlider, BackGreenSlider, BackBlueSlider, TextLamp, BackLamp, EmulatorTabTerminalLayout, TerminalLabels);

TextRedSlider.ValueChangedFcn = TerminalColourUpdateFun;
TextGreenSlider.ValueChangedFcn = TerminalColourUpdateFun;
TextBlueSlider.ValueChangedFcn = TerminalColourUpdateFun;
BackRedSlider.ValueChangedFcn = TerminalColourUpdateFun;
BackGreenSlider.ValueChangedFcn = TerminalColourUpdateFun;
BackBlueSlider.ValueChangedFcn = TerminalColourUpdateFun;
