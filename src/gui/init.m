% Most of this was generated with the MbwhaahaTLAB app designer.

% Create MainFigure and hide until all components are created
MainFigure = uifigure('Visible', 'off');
MainFigure.AutoResizeChildren = 'off';
MainFigure.Position = [100 100 640 480];
MainFigure.Name = 'A dubiously accurate Apple I emulator';
MainFigure.KeyPressFcn = @MainFigureKeyPress;

% Create GridLayout
GridLayout = uigridlayout(MainFigure);
GridLayout.ColumnWidth = {'1x'};
GridLayout.RowHeight = {'1x'};
GridLayout.Padding = [0 0 0 0];

% Create TabGroup
TabGroup = uitabgroup(GridLayout);
TabGroup.AutoResizeChildren = 'off';
TabGroup.Layout.Row = 1;
TabGroup.Layout.Column = 1;

%#include "src/gui/emulator/init.m"
%#include "src/gui/terminal/init.m"
%#include "src/gui/profiler/init.m"
%#include "src/gui/settings/init.m"
%#include "src/gui/about/init.m"

% Show the figure after all components are created
MainFigure.Visible = 'on';
