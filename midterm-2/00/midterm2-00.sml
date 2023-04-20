(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_take
(fxs: 'a stream, n: int): 'a stream = ...
*)

(* ****** ****** *)

(*
fun
stream_drop
(fxs: 'a stream, n: int): 'a stream = ...
*)

(* ****** ****** *)
fun
stream_take
(fxs: 'a stream, n: int): 'a stream = 
fn() =>
let 
fun
helper(ixs: 'a stream, n0: int): 'a strcon=
case ixs() of strcon_nil => strcon_nil 
| strcon_cons(x_hd,x_tl) =>
if n0 >= n then strcon_nil	
else strcon_cons(x_hd, fn() => helper(x_tl, n0+1))

in
helper(fxs, 0)

end 

fun
stream_drop
(fxs:'a stream, n:int): 'a stream =
fn() =>
let
fun
helper(ixs: 'a stream, n0: int): 'a strcon=
case ixs() of strcon_nil => strcon_nil 
| strcon_cons(x_hd,x_tl) =>
if n0 < n then helper(x_tl, n0+1)	
else strcon_cons(x_hd, fn() => helper(x_tl, n0))

in
helper(fxs, 0)

end
(* end of [CS320-2023-Spring-midterm2-00.sml] *)
