(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a stream fxs of real numbers a0, a1, a2, ...
and a real number x0, stream_evaluate(fxs, x0)
returns another stream of real number that enumerates
all of the following partial sums:
a0, a0 + a1*x0, a0 + a1*x0 + a2*x0^2, ...
The general form of the enumerated sums is given as follows:
(a0 + a1*x0 + a2*x0^2 + ... + an * x0^n)
//
Assume:
a0 = 0, a1 = 1, a2 = -1/2, a3 = 1/3, a4 = -1/4, ...
Then we have ln2 = stream_evaluate(fxs, 1.0) // see Assign06-01
//
*)
fun
stream_evaluate
(fxs: real stream, x0: real): real stream =
fn() =>
let

fun
helper(r0:real, inxs:real stream, i0: real): real strcon =
case inxs() of strcon_nil => strcon_nil
| strcon_cons(x_hd, x_tl) =>
strcon_cons(i0*x_hd + r0, fn() => helper(i0*x_hd + r0, x_tl, i0 * x0)) 

in

let 
val strcon_cons(fx_hd, fx_tl) = fxs()
in
strcon_cons(fx_hd, fn() => helper(fx_hd, fx_tl, x0))
end

end


(* ****** ****** *)

(*
fun
stream_evaluate
(fxs: real stream, x0: real): real stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-01.sml] *)
