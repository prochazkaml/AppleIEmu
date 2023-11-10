% Create UI figure

fig = uifigure;
set(fig, "Color", [0, 0, 0]);
set(fig, "WindowKeyPressFcn", @KeyPress);
set(fig, "Name", "A dubiously accurate Apple I emulator");
set(fig, "Resize", "off");
pos = get(fig, "Position");
pos(3) = config.RowSpacing * 42; % Will leave some empty space around the borders, I do not care
pos(4) = config.RowSpacing * 26;
set(fig, "Position", pos);

% Create 2 border labels, 24 terminal labels and 1 cursor label

global lbl;
lbl = cell(1, 24);

for row = 1:24
    lbl{row} = CreateTermLabel(fig, row + 1, "|                                        |");
end

% Create upper & lower border labels

CreateTermLabel(fig, 1, "+----------------------------------------+");
CreateTermLabel(fig, 26, "+----------------------------------------+");

% Create a blinking cursor label

global cursor;
cursor = CreateTermLabel(fig, 2, " @");

curtmr = timer();
curtmr.TimerFcn = @CursorBlink;
curtmr.Period = .5;
curtmr.ExecutionMode = "fixedRate";
start(curtmr);
