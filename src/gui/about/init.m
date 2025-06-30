% Create AboutTab
AboutTab = uitab(TabGroup);
AboutTab.Title = 'About';

% Create AboutTabGridLayout
AboutTabGridLayout = uigridlayout(AboutTab);
AboutTabGridLayout.ColumnWidth = {'1x', '3x'};
AboutTabGridLayout.RowHeight = {'1x', '1x', 30};

% Create AboutLogo
AboutLogo = uiimage(AboutTabGridLayout);
AboutLogo.Layout.Row = 1;
AboutLogo.Layout.Column = 1;
AboutLogo.ImageSource = fullfile('../assets', 'emulogo.jpg');

% Create AboutDescGridLayout
AboutDescGridLayout = uigridlayout(AboutTabGridLayout);
AboutDescGridLayout.ColumnWidth = {'1x'};
AboutDescGridLayout.Padding = [0 0 0 0];
AboutDescGridLayout.Layout.Row = 1;
AboutDescGridLayout.Layout.Column = 2;

% Create AboutNameLabel
AboutNameLabel = uilabel(AboutDescGridLayout);
AboutNameLabel.VerticalAlignment = 'bottom';
AboutNameLabel.WordWrap = 'on';
AboutNameLabel.FontSize = 24;
AboutNameLabel.Layout.Row = 1;
AboutNameLabel.Layout.Column = 1;
AboutNameLabel.Text = 'A dubiously accurate Apple I emulator';

% Create AboutDescLabel
AboutDescLabel = uilabel(AboutDescGridLayout);
AboutDescLabel.VerticalAlignment = 'top';
AboutDescLabel.Layout.Row = 2;
AboutDescLabel.Layout.Column = 1;
AboutDescLabel.Text = {'A reasonably fast Apple I emulator and debugger in MATLAB.'; ''; '(logo source: Stable Diffusion + my l33t GIMP skills)'};

% Create GridLayout7
GridLayout7 = uigridlayout(AboutTabGridLayout);
GridLayout7.RowHeight = {'1x'};
GridLayout7.Padding = [0 0 0 0];
GridLayout7.Layout.Row = 3;
GridLayout7.Layout.Column = 2;

% Create AboutBSDButton
AboutBSDButton = uibutton(GridLayout7, 'push');
AboutBSDButton.ButtonPushedFcn = @AboutBSDButtonPushed;
AboutBSDButton.Layout.Row = 1;
AboutBSDButton.Layout.Column = 2;
AboutBSDButton.Text = 'Read the BSD 3-Clause license';

% Create AboutMATLABLicenseButton
AboutMATLABLicenseButton = uibutton(GridLayout7, 'push');
AboutMATLABLicenseButton.ButtonPushedFcn = @AboutMATLABLicenseButtonPushed;
AboutMATLABLicenseButton.Layout.Row = 1;
AboutMATLABLicenseButton.Layout.Column = 1;
AboutMATLABLicenseButton.Text = 'Read the MATLAB license';

% Create AboutLicenseLabel
AboutLicenseLabel = uilabel(AboutTabGridLayout);
AboutLicenseLabel.WordWrap = 'on';
AboutLicenseLabel.Layout.Row = 2;
AboutLicenseLabel.Layout.Column = 2;
AboutLicenseLabel.Text = 'If you ignore the absolutely proprietary MATLAB runtime binary, this software is considered free software, licensed under the BSD 3-Clause license.';
