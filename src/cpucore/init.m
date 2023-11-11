% 6502 memory spaces

sysmem = zeros(1, 32768, 'uint8');

applerom = [
%#incbin "build/rom.bin"
];

% 6502 emulation core

a = 0x00;
x = 0x00;
y = 0x00;
%#incfun "src/cpucore/microcode/memory/getword.m" pc = 0xFFFC
p = 0x20; % Bit 5 is always 1
s = 0xFF;
b = 0x00; % Opcode byte

tmp8 = 0x00;
tmp16 = 0x0000;
tmp16_2 = 0x0000;
tmps16 = int16(0);
tmp32 = 0x00000000;
