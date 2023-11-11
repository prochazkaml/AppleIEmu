%#incfun "src/cpucore/microcode/zpg_x/abs.m" tmp16 = ~
%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = tmp16
%#incfun "src/cpucore/microcode/insn/lsr.m" tmp8 = tmp8
%#incfun "src/cpucore/microcode/memory/setbyte.m" tmp16 = tmp8
