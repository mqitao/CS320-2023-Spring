(* ****** ****** *)
(*
Assign00: Warmup!
*)
(* ****** ****** *)


(*fun fact(x: int): int =if x > 0 then x * fact(x-1) else 1;*)


(*
Assign00-01: 10 points
Please find the first integer N such that the
evaluation of fact(N) in SML/NJ yields an Overflow
exception.
*)

(* fact(13); *)

(* ****** ****** *)

(*
Assign00-02: 10 points
Please implement a function that tests whether a
given natural number is a prime:
fun isPrime(n0: int): bool

fun rePrime(n0 : int, n1 : int) : bool = 
	if not(n0 mod n1 = 0) then rePrime(n0, n1+1) else not(n0 > n1);
fun isPrime(n0: int): bool = if (n0 < 2) then false else rePrime(n0, 2); 

*)

(* ****** ****** *)

(*
Assign00-03: 10 points
Please implement a function that converts a given
integer to a string that represents the integer:

fun lastDigit(i1: int, cnt: int) : string =  
	if (i1 mod 10 = 0) then String.str(Char.chr(cnt + 48)) else lastDigit(i1 - 1, cnt + 1); 

fun int2str(i0:int) : string = 
	if i0 > 9 then
	int2str(i0 div 10) ^ lastDigit(i0, 0)
	else String.str(Char.chr(i0 + 48)); 

*)

(* ****** ****** *)

(*
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int = valOf(Int.fromString (cs));
In particular, it is expected that str2int(int2str(x)) = x


fun power(len: int) : int = if len > 0 then power(len -1) * 10 else 1;

fun restr2int(os: string, ns: char, dgt: int, posn: int): int = 
	if dgt > 1 then
	restr2int(os, String.sub(os, posn + 1), dgt - 1, posn + 1) + (Char.ord(ns) - 48) * power(dgt - 1)
	else Char.ord(ns) - 48; 

fun str2int(os: string): int = 
	restr2int(os, String.sub(os, 0), String.size(os), 0);
*)

(* ****** ****** *)

(*
Assign00-05: 10 points
Please implement a function that returns the reverse of
a given string:


fun restringrev(cs: string, posn: int): string = 
	if posn > 0 then String.str(String.sub(cs, posn)) ^ restringrev(cs, posn - 1)
	else String.str(String.sub(cs, posn));

fun stringrev(cs: string): string = 
	restringrev(cs, size(cs) - 1);
    
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00.sml] *)
