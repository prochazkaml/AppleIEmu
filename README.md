# ML6502 - An Apple I emulator for MATLAB®

> When life gives you lemons, make lemonade.

In this case, the _lemons_ was the mandatory MATLAB® university course, and the _lemonade_ is the abomination that is contained within this repository.

<!-- NOTE TO FUTURE SELF: I worked really hard on this joke. Please don't remove it if you find it cringe later :) -->

## What can it do?

It's exactly what you would expect from an Apple I emulator. When you boot it up, it drops you straight into WozMon, from which you can start typing in binary programs,
or you can just run Integer BASIC if you're not into that sort of thing.

The emulated hardware comprises of:

- A mostly-compliant 6502 CPU (without decimal mode, any undocumented opcodes or any interrupts).
- 48 kB of SRAM (0x0000-0xBFFF).
- An input/output interface (0xD010-0xD013).
- 4 kB Integer BASIC ROM (0xE000-0xEFFF).
- 4 kB WozMon + help text ROM (0xF000-0xFFFF).

The emulator has basic debugging capabilities. You can slow down the execution of your program (if set to 0, then you can single-step instructions)
and you may turn on the debugger to see the registers contents (as well as the currently loaded opcode).

To measure execution speed, there's a simple profiler in a separate tab that contains a constantly updating figure of the virtual CPU's execution speed.

## Building

To massively improve performance of the emulator, a preprocessor was created that substitutes common function calls with inline code.
Also, the ROM contains not only WozMon, but also Integer BASIC and my own intro text into the Apple I hardware.

Alongside `bash`, you also need to have installed:
- a C compiler (`gcc` will do) for compiling the compression utility
- the `xa` 6502 assembler
- the usual coreutils (xxd, grep, sed...)

To build the final output (`build/emu6502.m`), just run:

```bash
./build.sh
```
