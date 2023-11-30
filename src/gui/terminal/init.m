% Create 2 border labels, 24 terminal labels and 1 cursor label

TerminalLabels = cell(1, 27);

for row = 1:24
    TerminalLabels{row} = CreateTermLabel(EmulatorTabTerminalLayout, 26 - row, "|                                        |");
end

TerminalLabels{25} = CreateTermLabel(EmulatorTabTerminalLayout, 1, "+----------------------------------------+");
TerminalLabels{26} = CreateTermLabel(EmulatorTabTerminalLayout, 26, "+----------------------------------------+");

% Create a blinking cursor label

TerminalLabels{27} = CreateTermLabel(EmulatorTabTerminalLayout, 25, " @");

curtmr = timer();
curtmr.TimerFcn = @(tmr, event) CursorBlink(tmr, TerminalLabels{27});
curtmr.Period = .5;
curtmr.ExecutionMode = "fixedRate";
start(curtmr);
