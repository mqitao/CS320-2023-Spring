fun lastDigit(i1: int, cnt: int) : string =  
	if (i1 mod 10 = 0) then String.str(Char.chr(cnt + 48)) else lastDigit(i1 - 1, cnt + 1); 

fun int2str(i0:int) : string = 
	if i0 > 9 then
	int2str(i0 div 10) ^ lastDigit(i0, 0)
	else String.str(Char.chr(i0 + 48)); 