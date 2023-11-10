% Implements the BIT instruction.

% __ret1 = return value (most likely the P register)
% __arg1 = source data

__ret1 = bitor(bitand(__ret1, 0x3F), bitand(__arg1, 0xC0));

tmp8 = bitand(a, __arg1);

%#incfun "src/cpucore/microcode/flags/updatez.m" ~ = tmp8
