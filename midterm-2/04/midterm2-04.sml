(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// an infinite stream fxs of integers and returns a stream
// enumerating all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_drawdowns(fxs: int stream): int list stream = ... *)

(* ****** ****** *)

fun
stream_drawdowns(fxs: int stream): int list stream =
fn() =>
case fxs() of strcon_nil => strcon_nil
| strcon_cons(fx1, fxt) =>

let
fun
helper(last:int list, nxt:int stream): int list strcon =
let 
val strcon_cons(head, tail) = nxt()
in
if head > hd(last) then
strcon_cons(last, fn() => helper([head], tail))

else 
helper(last@[head], tail)

end
 
in
helper([fx1], fxt)

end;
(* end of [CS320-2023-Spring-midterm2-04.sml] *)
