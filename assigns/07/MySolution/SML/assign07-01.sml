(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)
fun
stream_ziplst(xss: 'a stream list): 'a list stream =
fn() =>
let
val helper1 = fn(ix) =>
	case ix() of strcon_nil => nil
	| strcon_cons(hds, tls) => [hds] 
val helper2 = fn(ix) =>
	case ix() of strcon_nil => [fn() => strcon_nil]	
	| strcon_cons(hds, tls) => [tls]
in
	let
	val str_hd = fn(xs) => foreach_to_foldleft(list_foreach)
	(xs, [], fn(r0, x1) => r0 @ helper1(x1))
	val str_tl = fn(xs) => foreach_to_foldleft(list_foreach)
	(xs, [], fn(r0, x1) => r0 @ helper2(x1)) 
	
	val test = fn(xs) => list_forall(xs, fn(xi) => 
	case xi() of strcon_nil => false | _ => true)
	
	fun helper3(xs, fopr, fopr2, test_no_nil) =
	if test_no_nil(xs) then 
	strcon_cons(fopr(xs), fn() => 
	helper3(fopr2(xs),fopr,fopr2,test_no_nil))
	else
	strcon_nil

	in
	helper3(xss, str_hd, str_tl, test)
	end
end;

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-01.sml] *)
