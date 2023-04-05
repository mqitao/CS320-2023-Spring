(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-02
*)
fun
stream_dupremov(fxs:int stream): int stream =
fn() =>
let
fun test(xi, r0) =
case r0 of nil => true
| r1::r0 => xi <> r1

fun helper(strm, filter, r0): int strcon =
	case strm() of strcon_nil => strcon_nil
	|strcon_cons(x_head, xs) => 
	if filter(x_head, r0) then
	
	strcon_cons(x_head, 
	fn() => helper(xs, filter, [x_head] ))
	
	else
	helper(xs, filter, r0)  
in
helper(fxs, test, [])

end;


(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)