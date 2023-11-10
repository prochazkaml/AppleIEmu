opcode = uint16(getbyte(pc));
pc = pc + 1;

% Decode the opcode

srctype = lut_src(opcode + 1);
desttype = lut_dest(opcode + 1);
optype = lut_op(opcode + 1);

if(srctype == 0xFF || desttype == 0xFF || optype == 0xFF)
  error("ERROR - INVALID OPCODE @ %04X: %02X\n", pc - 1, opcode)
end

src8 = 0x00;
src16 = 0x0000;
dest8 = 0x00;
dest16 = 0x0000;
alu_result = 0x00; % Used for determining the negative and zero flag

% Get the source data

srcaddr_set = false;
srcaddr = 0x0000;

switch(srctype)
  case 0x01 % Accumulator
	src8 = a;
  case 0x02 % X index register
	src8 = x;
  case 0x03 % Y index register
	src8 = y;
  case 0x04 % Program counter
	src16 = pc;
  case 0x05 % Processor status register
	src8 = p;
  case 0x06 % Stack pointer
	src8 = s;
  case 0x07 % Immediate value (uint8)
	src8 = getbyte(pc);
	pc = pc + 1;
  case 0x08 % Memory [val16]
	srcaddr_set = true;
	srcaddr = getword(pc);
	pc = pc + 2;
  case 0x09 % Memory [val16+X]
	srcaddr_set = true;
	srcaddr = getword(pc) + uint16(x);
	pc = pc + 2;
  case 0x0A % Memory [val16+Y]
	srcaddr_set = true;
	srcaddr = getword(pc) + uint16(y);
	pc = pc + 2;
  case 0x0B % Memory [[val16]]
	srcaddr_set = true;
	srcaddr = getword(getword(pc));
	pc = pc + 2;
  case 0x0C % Memory [[val8+X]]
	srcaddr_set = true;
	srcaddr = getword(getbyte(pc) + x);
	pc = pc + 1;
  case 0x0D % Memory [[val8]+Y]
	srcaddr_set = true;
	srcaddr = getword(getbyte(pc)) + uint16(y);
	pc = pc + 1;
  case 0x0E % Memory [val8]
	srcaddr_set = true;
	srcaddr = uint16(getbyte(pc));
	pc = pc + 1;
  case 0x0F % Memory [val8+X]
	srcaddr_set = true;
	srcaddr = uint16(getbyte(pc) + x);
	pc = pc + 1;
  case 0x10 % Memory [val8+Y]
	srcaddr_set = true;
	srcaddr = uint16(getbyte(pc) + y);
	pc = pc + 1;
  case 0x11 % Immediate value (uint16)
	src16 = getword(pc);
	pc = pc + 2;
  case 0x12 % Pop value from stack
	s = s + 0x1;
	src8 = getbyte(0x100 + uint16(s));
  case 0x13 % 0
	src8 = 0x00;
  case 0x14 % 1
	src8 = 0x01;
  % Flags are never used as sources
  case 0x19 % Memory [val16] (uint16)
	src16 = getword(getword(pc));
	pc = pc + 2;
end

if(srcaddr_set)
  src8 = getbyte(srcaddr);
end

% Get the current destination data (so that we can do meth on it later)

destaddr = 0xFFFF;

switch(desttype)
  case 0x01 % Accumulator
	dest8 = a;
  case 0x02 % X index register
	dest8 = x;
  case 0x03 % Y index register
	dest8 = y;
  case 0x04 % Program counter
	dest16 = pc;
  case 0x05 % Processor status register
	dest8 = p;
  case 0x06 % Stack pointer
	dest8 = s;
  case 0x08 % Memory [val16]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(pc);
	  pc = pc + 2;
	end
  case 0x09 % Memory [val16+X]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(pc) + uint16(x);
	  pc = pc + 2;
	end
  case 0x0A % Memory [val16+Y]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(pc) + uint16(y);
	  pc = pc + 2;
	end
  case 0x0B % Memory [[val16]]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(getword(pc));
	  pc = pc + 2;
	end
  case 0x0C % Memory [[val8+X]]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(getbyte(pc) + x);
	  pc = pc + 1;
	end
  case 0x0D % Memory [[val8]+Y]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getword(getbyte(pc)) + uint16(y);
	  pc = pc + 1;
	end
  case 0x0E % Memory [val8]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getbyte(pc);
	  pc = pc + 1;
	end
  case 0x0F % Memory [val8+X]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getbyte(pc) + x;
	  pc = pc + 1;
	end
  case 0x10 % Memory [val8+Y]
	if(srcaddr_set)
	  destaddr = srcaddr;
	else
	  destaddr = getbyte(pc) + y;
	  pc = pc + 1;
	end
  case { 0x07 0x11 0x13 0x14 } % Immediate value
	error("INTERNAL ERROR - IMMEDIATE USED AS DESTINATION @ %04X\n", pc)
  case 0x19 % Memory [val16] (uint16)
	error("INTERNEL ERROR - MEMORY WORD AS DESTINATION @ %04X\n", pc)
end

if(destaddr ~= 0xFFFF)
  dest8 = getbyte(destaddr);
end

% Perform the given operation

switch(optype)
  case 0x01 % (uint16)dest += (sint8)src if N clear
	if(bitand(p, 0x80) == 0x00)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x02 % (uint16)dest += (sint8)src if N set
	if(bitand(p, 0x80) == 0x80)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x03 % (uint16)dest += (sint8)src if V clear
	if(bitand(p, 0x40) == 0x00)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x04 % (uint16)dest += (sint8)src if V set
	if(bitand(p, 0x40) == 0x40)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x05 % (uint16)dest += (sint8)src if C clear
	if(bitand(p, 0x01) == 0x00)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x06 % (uint16)dest += (sint8)src if C set
	if(bitand(p, 0x01) == 0x01)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x07 % (uint16)dest += (sint8)src if Z clear
	if(bitand(p, 0x02) == 0x00)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x08 % (uint16)dest += (sint8)src if Z set
	if(bitand(p, 0x02) == 0x02)
	  dest16 = uint16(int32(dest16) + uint8tosint32(src8));
	end
  case 0x09 % (uint8)dest |= (uint8)src
	dest8 = uint8(bitor(dest8, src8));
	alu_result = dest8;
  case 0x0A % (uint8)dest &= (uint8)src
	dest8 = uint8(bitand(dest8, src8));
	alu_result = dest8;
  case 0x0B % (uint8)dest ^= (uint8)src
	dest8 = uint8(bitxor(dest8, src8));
	alu_result = dest8;
  case 0x0C % (uint8)dest += (uint8)src + C
%      fprintf("0x%02X += 0x%02X + %d; ", dest8, src8, uint16(bitand(p, 0x01)));
	tmp = uint16(uint16(dest8) + uint16(src8) + uint16(bitand(p, 0x01)));
%      fprintf("0x%04X\n", tmp);

	if(tmp >= 0x100) % Carry flag (bit 0) set if overflow
	  tmp = bitand(tmp, 0x00FF);
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end

	% todo, overflow flag

	dest8 = uint8(tmp);
	alu_result = dest8;
  case 0x0D % (uint8)dest -= (uint8)src + (1 - C) => (uint8)dest += (uint8)(255 - src) + C
	opr = uint8(255) - src8;
	tmp = uint16(uint16(dest8) + uint16(opr) + uint16(bitand(p, 0x01)));

	if(tmp >= 0x100) % Carry flag (bit 0) set if overflow
	  tmp = bitand(tmp, 0x00FF);
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end

	% todo, overflow flag

	dest8 = uint8(tmp);
	alu_result = dest8;
  case 0x0E % (uint8)dest - (uint8)src, do not save result
	tmp = int16(int16(dest8) - int16(src8));

%      fprintf("%d %d %d\n", dest8, src8, tmp);

	if(tmp < int16(0x0000)) % Carry flag (bit 0) set if *not* overflow
	  tmp = tmp + int16(0x100);
	  p = bitand(p, 0xFE);
	else
	  p = bitor(p, 0x01);
	end

	alu_result = uint8(tmp);
  case 0x0F % (uint8)dest = (uint8)src, affect N,Z flags
	dest8 = src8;
	alu_result = dest8;
  case 0x10 % (uint8)dest = (uint8)src << 1
	dest8 = uint8(bitshift(src8, 1));
	alu_result = dest8;

	if(bitand(src8, 0x80) == 0x80) % Carry flag (bit 0) set to the highest bit
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end
  case 0x11 % (uint8)dest = (uint8)src >> 1
	dest8 = uint8(bitshift(src8, -1));
	alu_result = dest8;

	if(bitand(src8, 0x01) == 0x01) % Carry flag (bit 0) set to the lowest bit
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end
  case 0x12 % (uint8)dest = rol((uint8)src)
	dest8 = uint8(bitor(uint8(bitshift(src8, 1)), uint8(bitand(p, 0x01))));
	alu_result = dest8;

	if(bitand(src8, 0x80) == 0x80) % Carry flag (bit 0) set to the highest bit
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end
  case 0x13 % (uint8)dest = ror((uint8)src)
	dest8 = uint8(bitor(uint8(bitshift(src8, -1)), uint8(bitand(p, 0x01) * 0x80)));
	alu_result = dest8;

	if(bitand(src8, 0x01) == 0x01) % Carry flag (bit 0) set to the lowest bit
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end
  case 0x14 % push(pc + 3); (uint16)dest = (uint16)src
	setbyte(0x100 + uint16(s), uint8(bitshift(pc, -8))) % No need to increment pc by 3 here, as it already was before (opcode + 16 bit address fetch)
	s = s - 0x1;
	setbyte(0x100 + uint16(s), uint8(bitand(pc, uint16(0xFF))))
	s = s - 0x1;
	dest16 = src16;
  case 0x15 % pop(pc)
	s = s + 0x1;
	pcl = getbyte(0x100 + uint16(s));
	s = s + 0x1;
	pch = getbyte(0x100 + uint16(s));
	dest16 = uint16(bitor(uint16(pcl), uint16(bitshift(uint16(pch), 8))));
  case 0x16 % pop(p); pop(pc)
	s = s + 0x1;
	p = getbyte(0x100 + uint16(s));
	s = s + 0x1;
	pcl = getbyte(0x100 + uint16(s));
	s = s + 0x1;
	pch = getbyte(0x100 + uint16(s));
	dest16 = uint16(bitor(uint16(pcl), uint16(bitshift(uint16(pch), 8))));
  case 0x17 % (uint8)dest[6..7] = (uint8)src & 0xC0
	dest8 = bitor(bitand(dest8, 0x3F), bitand(src8, 0xC0));
  case 0x18 % (uint8)dest += (uint8)src
	tmp = int16(int16(dest8) + int16(src8));

	if(tmp >= int16(0x100))
	  tmp = tmp - int16(0x100);
	end

	dest8 = uint8(tmp);
	alu_result = dest8;
  case 0x19 % (uint8)dest -= (uint8)src
	tmp = int16(int16(dest8) - int16(src8));

	if(tmp < int16(0x0000))
	  tmp = tmp + int16(0x100);
	end

	dest8 = uint8(tmp);
	alu_result = dest8;
  case 0x1A % (uint16)dest = (uint16)src
	dest16 = src16;
  case 0x1B % (uint8)dest = (uint8)src, no flags affected
	dest8 = src8;
end

% Post-determine the negative and zero flag for instructions which set them

switch(optype)
  % ora, and, eor, adc, sbc, cmp, cpx, cpy, asl, lsr, rol, ror, inc, inx, iny, dec, dex, dey, lda, ldx, ldy, pla, tax, tay, tsx, txa, tya

  case { 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F 0x10 0x11 0x12 0x13 0x18 0x19 }
%      fprintf("ALU %02X\n", alu_result);

	if(alu_result == 0x00) % Zero flag = bit 1
	  p = bitor(p, 0x02);
	else
	  p = bitand(p, 0xFD);
	end

	if(bitand(alu_result, 0x80) == 0x80) % Negative flag = bit 7
	  p = bitor(p, 0x80);
	else
	  p = bitand(p, 0x7F);
	end
end

% Write the result back to the destination

switch(desttype)
  case 0x01 % Accumulator
	a = dest8;
  case 0x02 % X index register
	x = dest8;
  case 0x03 % Y index register
	y = dest8;
  case 0x04 % Program counter
	pc = dest16;
  case 0x05 % Processor status register
	p = dest8;
  case 0x06 % Stack pointer
	s = dest8;
  case { 0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F 0x10 }
	if(destaddr == 0xFFFF)
	  error("INTERNAL ERROR - NO ADDRESS SET AS DESTINATION @ %04X\n", pc)
	end

	setbyte(destaddr, dest8)
  case 0x12 % Stack
	setbyte(0x100 + uint16(s), dest8)
	s = s - 0x1;
  case 0x15 % Carry flag
	if(src8 >= 0x01)
	  p = bitor(p, 0x01);
	else
	  p = bitand(p, 0xFE);
	end
  case 0x16 % Interrupt flag
	if(src8 >= 0x01)
	  p = bitor(p, 0x04);
	else
	  p = bitand(p, 0xFB);
	end
  case 0x17 % Decimal flag
	if(src8 >= 0x01)
	  p = bitor(p, 0x08);
	else
	  p = bitand(p, 0xF7);
	end
  case 0x18 % Overflow flag
	if(src8 >= 0x01)
	  p = bitor(p, 0x40);
	else
	  p = bitand(p, 0xBF);
	end
  case { 0x07 0x11 0x13 0x14 } % Immediate value
	error("INTERNAL ERROR - IMMEDIATE USED AS DESTINATION @ %04X\n", pc)
  case 0x19 % Memory [val16] (uint16)
	error("INTERNEL ERROR - MEMORY WORD AS DESTINATION @ %04X\n", pc)
end
