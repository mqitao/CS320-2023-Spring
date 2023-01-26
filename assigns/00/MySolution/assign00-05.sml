fun restringrev(cs: string, posn: int): string = 
	if posn > 0 then String.str(String.sub(cs, posn)) ^ restringrev(cs, posn - 1)
	else String.str(String.sub(cs, posn));

fun stringrev(cs: string): string = 
	if String.size(cs) = 0 then "" 
	else restringrev(cs, size(cs) - 1);