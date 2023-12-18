% Apple I Emulator for MATLAB
% Written by Michal Procházka in 2023 for our ITE/MTLB classes.
% Emulates the following hardware:
%   - A mostly-compliant 6502 CPU (without decimal mode, any undocumented opcodes or any interrupts).
%   - 48 kB of SRAM (0x0000-0xBFFF).
%   - An input/output interface (0xD010-0xD013).
%   - 4 kB Integer BASIC ROM (0xE000-0xEFFF).
%   - 4 kB WozMon + help text ROM (0xF000-0xFFFF).

clc; clearvars;

%#include "src/gui/init.m"
%#include "src/cpucore/init.m"

tic;

while 1
%#include "src/gui/profiler/update.m"
%#include "src/cpucore/checkreset.m"
%#include "src/gui/terminal/update.m"
% #include "src/cpucore/debug.m"
%#include "src/gui/emulator/debugger.m"
%#include "src/gui/emulator/limiter.m"
%#include "src/cpucore/executeinstruction.m"

%{
if pc == 0x0000
    EmulatorDebuggerKnob.Value = "On";
    emulatordebugger = 1;

    EmulatorCpuSpeedKnob.Value = 0;
    emulatorcpuspeed = 0;

    EmulatorStepButton.Visible = 1;

    GridLayout9.RowHeight{2} = 100;
end
%}

    insns = insns + 1;
end

% Subroutines

%#include "src/gui/settings/subroutines.m"
%#include "src/gui/emulator/subroutines.m"
%#include "src/gui/terminal/subroutines.m"
%#include "src/gui/profiler/subroutines.m"
%#include "src/gui/about/subroutines.m"
