function AboutMATLABLicenseButtonPushed(src, event)
	DialogFigure = uifigure('Visible', 'off');
	DialogFigure.AutoResizeChildren = 'off';
	DialogFigure.Position = [100 100 640 480];
	DialogFigure.Name = 'MATLAB License -- A dubiously accurate Apple I emulator';
	
	GridLayout = uigridlayout(DialogFigure);
	GridLayout.ColumnWidth = {'1x'};
	GridLayout.RowHeight = {'1x'};
	GridLayout.Padding = [0 0 0 0];

	License = uiimage(GridLayout);
	License.Layout.Row = 1;
	License.Layout.Column = 1;
	License.ImageSource = fullfile('../assets', 'mllicense.jpg');	

	DialogFigure.Visible = 'on';
end
