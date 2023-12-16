%#incfun "src/cpucore/microcode/memory/getword.m" tmp16_2 = pc
pc = pc + 1;
%#incfun "src/cpucore/microcode/memory/stack_push_word.m" ~ = pc

tmp8 = bitor(p, 0x30); % set break and reserved bits
%#incfun "src/cpucore/microcode/memory/stack_push.m" ~ = tmp8

%#incfun "src/cpucore/microcode/memory/getword.m" pc = 0x0000FFFE

p = bitor(p, 0x04); % set IRQ disable flag
