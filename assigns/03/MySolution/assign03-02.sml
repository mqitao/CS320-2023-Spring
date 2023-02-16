(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
list_range(x, y) returns a list consisting
of all the integers i satisfying x <= i < y.
//
For instance,
list_range(1, 1) = []
list_range(2, 1) = []
list_range(0, 5) = [0,1,2,3,4]
//
Please give a tail-recusive implementation of
the list_range function
//
fun list_range(start: int, finish: int): int list
*)
fun list_range(start: int, finish: int): int list=
	let fun list_recur(str:int, fin:int): int list=
			if str >= fin then nil
			else [str] @ list_range(str+1, finish)	  

	in list_recur(start, finish)
	end;	

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-02.sml] *)
