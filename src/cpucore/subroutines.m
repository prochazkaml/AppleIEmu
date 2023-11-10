function retval = uint8tosint32(srcval)
	if(srcval >= 128)
		retval = int32(int32(srcval) - int32(256));
	else
		retval = int32(srcval);
	end
end
