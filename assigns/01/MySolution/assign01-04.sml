val strsub = String.sub;
val ord = Char.ord;
val strlen = String.size;

fun ch_legal(chr: char): int = 
	if (ord(chr) >= 48) = (ord(chr) <= 57) then 0
	else 1;

fun is_legal(cs: string, cur: int, sum:int): int = 
	if (strlen(cs) > cur) then is_legal(cs, cur+1, ch_legal(strsub(cs, cur)) + sum)
	else sum;

fun power(len: int) : int = 
	if len > 0 then power(len -1) * 10 
	else 1;

fun restr2int(cs: string, chr: char, dgt: int, posn: int): int = 
	if dgt > 1 then
	restr2int(cs, strsub(cs, posn + 1), dgt - 1, posn + 1) + (ord(chr) - 48) * power(dgt - 1)
	else ord(chr) - 48; 

fun str2int(cs: string): int option = 
	if is_legal(cs, 0, 0) > 0 then NONE
	else SOME(restr2int(cs, strsub(cs, 0), String.size(cs), 0));

fun str2int_opt(cs: string): int option = 
	if cs = "" then NONE
	else str2int(cs);

	