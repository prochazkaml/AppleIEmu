%#incfun "src/cpucore/microcode/addr/zpg_x.m" tmp16 = ~
%#incfun "src/cpucore/microcode/memory/getbyte.m" tmp8 = tmp16
%#incfun "src/cpucore/microcode/insn/ror.m" tmp8 = tmp8
%#incfun "src/cpucore/microcode/memory/setbyte.m" ~ = tmp16 tmp8
