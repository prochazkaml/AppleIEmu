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

% Create AboutLicenseLogo
AboutLicenseLogo = uiimage(AboutTabGridLayout);
AboutLicenseLogo.Layout.Row = 2;
AboutLicenseLogo.Layout.Column = 1;
AboutLicenseLogo.ImageSource = fullfile('../assets', 'gnu.svg');

% Create GridLayout7
GridLayout7 = uigridlayout(AboutTabGridLayout);
GridLayout7.RowHeight = {'1x'};
GridLayout7.Padding = [0 0 0 0];
GridLayout7.Layout.Row = 3;
GridLayout7.Layout.Column = 2;

% Create AboutGPLButton
AboutGPLButton = uibutton(GridLayout7, 'push');
AboutGPLButton.ButtonPushedFcn = @AboutGPLButtonPushed;
AboutGPLButton.Layout.Row = 1;
AboutGPLButton.Layout.Column = 2;
AboutGPLButton.Text = 'Read the GPL v3.0 license';

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
AboutLicenseLabel.Text = 'If you ignore the absolutely proprietary MATLAB runtime binary, this software is considered free software, licensed under the GNU General Public License v3.0.';
