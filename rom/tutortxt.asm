tutorial_msg_1:
	.byt 13, 13
	.byt 'Welcome to the WozMon tutorial!', 13
	.byt '"""""""""""""""""""""""""""""""', 13
	.byt 'WozMon is a simple monitor program that', 13
	.byt 'allows you to read and write values in', 13
	.byt 'memory, as well as run machine code.', 13
	.byt 13
	.byt 'You have just typed the following:', 13
	.byt 13
	.byt '  F000R', 13
	.byt 13
	.byt 'This was a command to start executing', 13
	.byt 'machine code from address 0xF000, where', 13
	.byt 'this tutorial program is located.', 13
	.byt 13
	.byt 'But before we can dive into using the', 13
	.byt 'monitor, we need to learn a bit about', 13
	.byt 'the Apple I architecture itself.', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 13, 13, 13, 0

tutorial_msg_2:
	.byt 'The Apple I is a computer designed by', 13
	.byt 'Steve Wozniak and released in 1976', 13
	.byt 'by the Apple Computer Company.', 13
	.byt 13
	.byt 'The Apple I is made up of regular', 13
	.byt 'off-the-shelf components that were', 13
	.byt 'available back then. These include:', 13
	.byt 13
	.byt ' +--u--+   * MOS 6502 microprocessor', 13
	.byt '-+     +-    (running at about 1 MHz)', 13
	.byt '-+  6  +-  * 4K of RAM (expandable)', 13
	.byt '-+  5  +-  * 256 ***bytes*** of ROM', 13
	.byt '-+  0  +-    (containing the WozMon)', 13
	.byt '-+  2  +-  * MOS 6820 PIA (Peripheral', 13
	.byt '-+     +-    Interface Adapter)', 13
	.byt ' +-----+   * a bunch of TTL logic chips', 13
	.byt 13
	.byt 'The MOS 6502 is a 8-bit microprocessor', 13
	.byt 'with 16-bit addressing. This means that', 13
	.byt 'it can address up to 64kB of memory.', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 0

tutorial_msg_3:
	.byt 'The problem is - unlike the Z80 or many', 13
	.byt 'later microprocessors (including the x86';, 13
	.byt 'ones we use today), the 6502 does not', 13
	.byt 'a dedicated bus for I/O. Instead,', 13
	.byt 'computer designers had to map I/O', 13
	.byt 'devices into the memory address space.', 13
	.byt 13
	.byt 'The Apple I luckily only had to deal', 13
	.byt 'with a single I/O device - the PIA.', 13
	.byt 13
	.byt 'The PIA is a chip which gave the 6502', 13
	.byt '16 digital input/output lines (similar', 13
	.byt 'to what a modern Arduino has).', 13
	.byt 'The Apple I uses 8 lines to connect to', 13
	.byt 'a standard ASCII keyboard, and 8 lines', 13
	.byt 'to connect to its built-in video', 13
	.byt 'terminal.', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 13, 13, 13, 0

tutorial_msg_4:
	.byt 'Thus, the Apple I has the following', 13
	.byt 'memory map:', 13
	.byt 13
	.byt '  0x0000-0x0FFF: RAM', 13
	.byt '  0xD010-0xD013: PIA ', 13
	.byt '  0xFF00-0xFFFF: ROM', 13
	.byt 13
	.byt 'The video terminal of the Apple I is', 13
	.byt 'very simple. It is a 40x24 character', 13
	.byt 'generator capable of drawing 64', 13
	.byt 'distinct characters (equivalent to)', 13
	.byt 'ASCII values 32 to 95).', 13
	.byt 13
	.byt 'This emulator attempts to emulate the', 13
	.byt 'Apple I hardware as closely as possible.';, 13
	.byt 'However, the RAM was expanded to 32kB', 13
	.byt 'and the ROM was expanded to 8kB to also', 13
	.byt 'include Integer BASIC as well as this', 13
	.byt 'tutorial program.', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 13, 0

tutorial_msg_5:
	.byt 'When the Apple I is powered on, the', 13
	.byt '6502 starts executing code from', 13
	.byt 'the 256 byte ROM, where the WozMon', 13
	.byt 'monitor program is located.', 13
	.byt 13
	.byt 'The WozMon gives the user the means', 13
	.byt 'to manipulate the system memory and', 13
	.byt 'start loaded programs.', 13
	.byt 13
	.byt 'All of this is accomplished through', 13
	.byt 'its simple command line interface.', 13
	.byt 13
	.byt 'In order to read data from memory, you', 13
	.byt 'can simply type its hexadecimal address:';, 13
	.byt 13
	.byt '  0000', 13
	.byt 13
	.byt 'The monitor should repond with:', 13
	.byt 13
	.byt '  0000: AD', 13
	.byt 13
	.byt 'Or whatever might be at that address.', 13
	.byt 13
	.byt 'Press any key to continue.             ', 0

tutorial_msg_6: .byt 13, 13 ; The last msg is missing a newline at the end
	.byt 'To write data to memory, you can type', 13
	.byt 'the address, followed by a colon, and', 13
	.byt 'then the data to write:', 13
	.byt 13
	.byt '  0000: 12', 13
	.byt 13
	.byt 'The monitor should respond with:', 13
	.byt 13
	.byt '  0000: AD', 13
	.byt 13
	.byt 'Do not be scared, the monitor is', 13
	.byt 'telling you the _previous_ value', 13
	.byt 'that was at that address.', 13
	.byt 13
	.byt 'If you check the address again, you', 13
	.byt 'should see the new value:', 13
	.byt 13
	.byt '  0000: 12', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 13, 13, 0

tutorial_msg_7:
	.byt 'You can also write multiple bytes at', 13
	.byt 'once. To do this, just enter multiple', 13
	.byt 'hexadecimal values. The monitor will', 13
	.byt 'automatically increment the address', 13
	.byt 'for you.', 13
	.byt 13
	.byt '  0000: 12 34 56 78 9A BC DE F0', 13
	.byt 13
	.byt 'Again, the monitor will respond with', 13
	.byt 'the previous value at the starting', 13
	.byt 'address.', 13
	.byt 13
	.byt 'To read multiple bytes, you can just', 13
	.byt 'enter the starting address and the', 13
	.byt 'ending address, deliminated by a period:';, 13
	.byt 13
	.byt '  0000.0007', 13
	.byt 13
	.byt 'You should now see the bytes you just', 13
	.byt 'wrote before.', 13
	.byt 13
	.byt 'Press any key to continue.', 13, 13, 0

tutorial_msg_8: .byt 13
	.byt 'You may use the WozMon to enter', 13
	.byt 'a binary program into memory. One such', 13
	.byt 'example program would be:', 13
	.byt 13
	.byt '  0000: A9 00 AA 20 EF FF E8 8A 4C 02 00';, 13
	.byt 13
	.byt 'This will store a simple program that', 13
	.byt 'indefinitely prints all possible', 13
	.byt 'characters to the screen.', 13
	.byt 13
	.byt 'To run this program, you type the', 13
	.byt 'starting address, followed by the', 13
	.byt 'letter "R":', 13
	.byt 13
	.byt '  0000R', 13
	.byt 13
	.byt 'The tutorial is now over, you will be', 13
	.byt 'returned to the monitor prompt.', 13
	.byt 'You may now try to type the above', 13
	.byt 'program into memory and run it.', 13
	.byt 'To stop it, press the RESET button.', 13
	