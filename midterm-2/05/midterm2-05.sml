(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of xs satisfying
c < a < b. Note that a, b, and c do not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231(xs: int list): bool = ...
*)
fun
perm_capture_231(xs: int list): bool =
let

fun
helper1(fxs: int list, x_int:int list): int list =
list_foldleft(fxs, x_int, fn(r0, x0) => 
if list_length(r0) = 1 andalso x0 > hd(r0) then r0 @ [x0]
else 
if list_length(r0) = 2 andalso x0 < hd(r0) then r0 @ [x0]
else r0)

fun
helper2(fx: int list): bool =
case list_length(fx) < 3 of true => false 
| false => 
if list_length(helper1( tl(fx), [hd(fx)] )) >= 3 then true
else helper2(tl(fx)) 
in
helper2(xs)

end




(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05.sml] *)
