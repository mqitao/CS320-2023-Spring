(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)

(*
fun
list_nchoose2(xs: int list): (int * int) list = ...
*)

(* ****** ****** *)
fun list_nchoose(xs: int list): (int * int) list list =
    let 
    val ys = xs
    val return =
    list_map(xs, fn(x1) => list_reduce_left
	(ys, [], fn(r0, xi) => if xi > x1 then r0 @ [(x1, xi)] else r0))
    in return
    end;

fun
list_nchoose2(xs: int list): (int * int) list =
   list_reduce_left(list_nchoose(xs), [], fn(r, x)=> if x = nil then r else r @ x)    


(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
