% Implements the EOR instruction.

% __ret1 = return value
% __arg1 = source data

__ret1 = bitxor(__ret1, __arg1)

%#incfun "src/cpucore/microcode/flags/updatenz.m" ~ = __ret1
