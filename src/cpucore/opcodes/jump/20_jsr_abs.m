%#incfun "src/cpucore/microcode/memory/getword.m" tmp16_2 = pc
pc = pc + 1;
%#incfun "src/cpucore/microcode/memory/stack_push_word.m" ~ = pc
pc = tmp16_2;
