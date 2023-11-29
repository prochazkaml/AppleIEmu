% Create MIDISetupTab
MIDISetupTab = uitab(SettingsSubtabGroup);
MIDISetupTab.Title = 'MIDI setup';

% Create MIDISetupGridLayout
MIDISetupGridLayout = uigridlayout(MIDISetupTab);
MIDISetupGridLayout.ColumnWidth = {'1x'};
MIDISetupGridLayout.RowHeight = {20, '1x'};

% Create MIDISetupLabel
MIDISetupLabel = uilabel(MIDISetupGridLayout);
MIDISetupLabel.Layout.Row = 1;
MIDISetupLabel.Layout.Column = 1;
MIDISetupLabel.Text = 'In order for the virtual Apple I to produce sound, it needs to be connected to a software MIDI synthesizer.';
