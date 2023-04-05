(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

val the_ln2_stream: real stream = fn() => 
	let
	fun helper(i, k): real strcon =
		if k mod 2 = 0 then 
		strcon_cons (i, fn () => helper(i - real 1 / real k, k+1) )
		else 
		strcon_cons (i, fn () => helper(i + real 1 / real k, k+1) ) 
	in helper(1.0, 2)
	end;

fun
stream_ziplst(xss: 'a stream list): 'a list stream =
fn() =>
let
val helper1 = fn(ix) =>
	case ix() of strcon_nil => nil
	| strcon_cons(hds, tls) => [hds] 
val helper2 = fn(ix) =>
	case ix() of strcon_nil => nil
	| strcon_cons(hds, tls) => [tls]
in
	let
	val str_hd = fn(xs) => foreach_to_foldleft(list_foreach)
	(xs, [], fn(r0, x1) => r0 @ helper1(x1))
	val str_tl = fn(xs) => foreach_to_foldleft(list_foreach)
	(xs, [], fn(r0, x1) => r0 @ helper2(x1)) 
	
	fun helper3(xs, fopr, fopr2) = 
	strcon_cons(fopr(xs), fn() => helper3(fopr2(xs),fopr,fopr2))
	in
	helper3(xss, str_hd, str_tl)
	end
end;
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)
