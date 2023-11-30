% 6502 memory spaces

sysmem = zeros(1, 32768, 'uint8');

applerom = [
%#incbin "build/rom.bin"
];

% 6502 emulation core

%#include "src/cpucore/reset.m"

global shouldreset;
shouldreset = 0;
