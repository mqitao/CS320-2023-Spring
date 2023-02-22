use "./../../../mysmlib/mysmlib-cls.sml"

val strlen = foreach_to_length(string_foreach)
val strsub = foreach_to_get_at(string_foreach)


fun quiz02_01(word: string): char -> int =
	fn(chr:char) => 
	let 
		val length = strlen(word)
		
		fun loop(i0:int, r0:int, len, wrd:string):int =
		if i0 = len then r0 
		else (if strsub(wrd, i0) = chr then loop(i0+1, r0+1, len, wrd) 
			else loop(i0+1, r0, len, wrd)) 
	in loop(0, 0, length, word)
	end