fun power(len: int) : int = if len > 0 then power(len -1) * 10 else 1;

fun restr2int(os: string, ns: char, dgt: int, posn: int): int = 
	if dgt > 1 then
	restr2int(os, String.sub(os, posn + 1), dgt - 1, posn + 1) + (Char.ord(ns) - 48) * power(dgt - 1)
	else Char.ord(ns) - 48; 

fun str2int(os: string): int = 
	restr2int(os, String.sub(os, 0), String.size(os), 0);