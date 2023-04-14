(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)
open List

fun
inter_str(xr:'a list, x:'a list, xs:'a list): 'a list stream =
fn() =>
case xs of nil => 
strcon_cons(xr@x, fn() => strcon_nil)
| xh::xt => 
let 
val head = xr@x@xs
val tail = xr@[xh]
in
strcon_cons(head, inter_str(tail, x, xt))
end;
	

fun
stream_permute_list(in_x:'a list):'a list stream =
case 
list_length(in_x) of 0 => (fn() => strcon_nil)
| 1 => (fn() => strcon_cons(in_x, fn() => strcon_nil) )
| 2 => inter_str([], [hd(in_x)], tl(in_x))
| _ =>
let 
val xh::xt = in_x

fun 
helper(head:'a list, strm:'a list stream):'a list stream =
case strm() of strcon_nil => (fn() => strcon_nil)
| strcon_cons(cur, nxt) =>
let
val cur_stream = inter_str([], head, cur)

fun
iter(fxs:'a list stream): 'a list stream=
case fxs() of strcon_nil => helper(head, nxt)
| strcon_cons(heads, tails) =>
( fn() => strcon_cons(heads, iter(tails)) )

in
iter(cur_stream)

end


in
helper([xh], stream_permute_list(xt) )

end;