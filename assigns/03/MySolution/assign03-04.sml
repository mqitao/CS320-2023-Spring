(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)
fun find_longest(xs: int list list): int list=
	let 
	fun list_comp(xs: int list, ys: int list): bool =
		let 
		fun list_size(cs: int list): int =
			(case cs of nil => 0 
			| c1::cs => 1+list_size(cs) 	
			)
	val xs_v = list_size(xs)
	val ys_v = list_size(ys)
	in xs_v > ys_v
	end	
	
	fun find_recur(xs: int list list, rtn:int list): int list=  
	(case xs of nil => rtn
	|x1::xs => (case list_comp(x1,rtn) of true => find_recur(xs, x1) 
	| false => find_recur(xs, rtn)))

	in (case xs of nil => nil
		| x1::xs => find_recur(xs, x1)
		)
	end
    
fun list_longest_ascend(xs: int list): int list =
	let 
	fun helper(xs:int list list, num:int): int list list=
		(case xs of nil => [[num]] | x1::xs => 
		(case hd(x1) > num of true => [x1]@helper(xs,num) | 
		false => [[num] @ x1] @ [x1] @ helper(xs,num))  
		)
	
	fun longest_asc_list(xs: int list, ys: int list list): int list list =
		(case xs of nil => ys
		| x1::xs => longest_asc_list(xs, helper(ys, x1)) 
		)		
	val ys = longest_asc_list(xs, nil)

	in List.rev(find_longest(ys))
	end
(* end of [CS320-2023-Spring-assign03-04.sml] *)
