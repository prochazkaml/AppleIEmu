% 6502 Emulator for MethLab®
% Written by Michal Procházka in 2023 for our ITE/MTLB classes.
% Emulates (or it will, lol) the following hardware:
%   - A mostly-compliant 6502 CPU (without the BRK instruction/flag, decimal mode, any undocumented opcodes or any interrupts).
%   - 32 kB of SRAM (0x0000-0x7FFF).
%   - An input/output interface (0xD010-0xD013).
%   - idk-how-many-kb Integer BASIC ROM (idk which address)
%   - 256 byte WozMon ROM (0xFF00-0xFFFF).

% TODO
% - if an error occurs, shut down the figure
% - FINISH ADC/SBC (THE OVERFLOW FLAG)
% - RUN A TEST SUITE FOR ALL INSTRUCTIONS
% - test MATLAB's audio capability

clc; clearvars;

% Configurable options

global config;
config.FontSize = 20;
config.RowSpacing = 20;

% Keyboard buffer

global keybuf;
keybuf = 0x00;

% Keyboard map

global kbdmap;
kbdmap = [... % 0x00 = invalid character
    0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x0D 0x00 0x00 0x0D 0x00 0x00 ...
    0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 ...
    0x20 0x21 0x22 0x23 0x24 0x25 0x26 0x27 0x28 0x29 0x2A 0x2B 0x2C 0x2D 0x2E 0x2F ...
    0x30 0x31 0x32 0x33 0x34 0x35 0x36 0x37 0x38 0x39 0x3A 0x3B 0x3C 0x3D 0x3E 0x3F ...
    0x40 0x41 0x42 0x43 0x44 0x45 0x46 0x47 0x48 0x49 0x4A 0x4B 0x4C 0x4D 0x4E 0x4F ...
    0x50 0x51 0x52 0x53 0x54 0x55 0x56 0x57 0x58 0x59 0x5A 0x5B 0x5C 0x5D 0x5E 0x5F ...
    0x27 0x41 0x42 0x43 0x44 0x45 0x46 0x47 0x48 0x49 0x4A 0x4B 0x4C 0x4D 0x4E 0x4F ...
    0x50 0x51 0x52 0x53 0x54 0x55 0x56 0x57 0x58 0x59 0x5A 0x5B 0x5C 0x5D 0x2D 0x21 ...
];

%#include "src/gui/init.m"
%#include "src/cpucore/init.m"

profileinsns = zeros(1);
insns = 0;

global shouldreset;
shouldreset = 0;

tic;

while(isvalid(MainFigure))
    if toc >= 1
        tic;

        % fprintf("Executed: %d\n", insns);
        profileinsns(length(profileinsns) + 1) = insns;
        UpdateProfiler(profileinsns, ProfilerFigure);

        insns = 0;
    end

    if shouldreset == 1
%#include "src/cpucore/reset.m"

        shouldreset = 0;
    end

%#include "src/gui/terminal/update.m"
% #include "src/cpucore/debug.m"
%#include "src/cpucore/executeinstruction.m"

    insns = insns + 1;
end

% Subroutines

%#include "src/cpucore/subroutines.m"
%#include "src/gui/settings/terminal/subroutines.m"
%#include "src/gui/emulator/subroutines.m"
%#include "src/gui/terminal/subroutines.m"
%#include "src/gui/profiler/subroutines.m"
%#include "src/gui/about/subroutines.m"
