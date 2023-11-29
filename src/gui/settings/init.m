% Create SettingsTab
SettingsTab = uitab(TabGroup);
SettingsTab.Title = 'Settings';

% Create SettingsTabContainer
SettingsTabContainer = uigridlayout(SettingsTab);
SettingsTabContainer.ColumnWidth = {'1x'};
SettingsTabContainer.RowHeight = {'1x'};
SettingsTabContainer.Padding = [0 0 0 10];

% Create SettingsSubtabGroup
SettingsSubtabGroup = uitabgroup(SettingsTabContainer);
SettingsSubtabGroup.Layout.Row = 1;
SettingsSubtabGroup.Layout.Column = 1;

%#include "src/gui/settings/terminal/init.m"
%#include "src/gui/settings/midi/init.m"
