% 6502 memory spaces

applerom = [
%#incbin "build/rom.bin"
];

sysmem = [zeros(1, 65536 - length(applerom), 'uint8') applerom];

%sysmem = [
%%#incbin "testrom.bin"
%];

% 6502 emulation core

%#include "src/cpucore/reset.m"
