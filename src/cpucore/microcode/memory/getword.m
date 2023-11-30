% __arg1 = source address
% __ret1 = destination

__ret1 = bitor(uint16(sysmem(__arg1 + 1)), uint16(sysmem(__arg1 + 2)) * 256);
