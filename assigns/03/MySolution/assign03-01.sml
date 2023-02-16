(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)
fun find_root(f0:int -> int): int =
	let 
	val n = 0	
	fun recur_root(f0:int ->int, n:int): int =
		(case (f0(n) = 0) of true => n
		| false => (case n of 0 => recur_root(f0, n+1)
			| n => (case (n<0) of true => recur_root(f0, ~n+1)
				| false => recur_root(f0, ~n))
			)   
		)
	in recur_root(f0, n)
	end;

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01.sml] *)