% __arg1 = source address
% __ret1 = destination

if(__arg1 >= 0x0000 && __arg1 < 0x7FFF) % Main system memory
	__ret1 = bitor(uint16(sysmem(__arg1 + 1)), uint16(sysmem(__arg1 + 2)) * 256);
elseif(__arg1 >= 0xF000 && __arg1 < 0xFFFF) % Apple system ROM
	__ret1 = bitor(uint16(applerom(__arg1 - 0xEFFF)), uint16(applerom(__arg1 - 0xEFFE)) * 256); % __arg1 - 0xF000 + 1
else
	error("ERROR - INVALID MEMORY WORD READ FROM %04X\n", __arg1)
end
