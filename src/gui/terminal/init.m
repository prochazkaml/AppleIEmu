% Create 2 border labels, 24 terminal labels and 1 cursor label

global lbl;
lbl = cell(1, 24);

for row = 1:24
    lbl{row} = CreateTermLabel(EmulatorTabTerminalLayout, 26 - row, "|                                        |");
end

lbl{25} = CreateTermLabel(EmulatorTabTerminalLayout, 1, "+----------------------------------------+");
lbl{26} = CreateTermLabel(EmulatorTabTerminalLayout, 26, "+----------------------------------------+");

% Create a blinking cursor label

global cursor;
cursor = CreateTermLabel(EmulatorTabTerminalLayout, 25, " @");
lbl{27} = cursor;

curtmr = timer();
curtmr.TimerFcn = @CursorBlink;
curtmr.Period = .5;
curtmr.ExecutionMode = "fixedRate";
start(curtmr);
