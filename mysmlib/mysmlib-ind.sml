(* ****** ****** *)
(*
HX-2023-01-22:
Library functions
for BUCASCS320-2023-Spring
This is an individual library, which
is not shared by the class.
//
Please build it up for your OWN use.
//
*)
(* ****** ****** *)


fun
foreach_to_foldleft
( foreach: ('xs * ('x0 -> unit)) -> unit)
: ('xs * 'r0 * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in

(* the res := operation means that conduct whatever opeartion proceeding the :=
symbol, and afterwards, updete res with the resulting value of the operations proceeding
:= while returning () to the terminal *)
foreach( xs, fn(x0) => res := fopr(!res, x0)); !res
end (* end of [foreach_to_foldleft]: let *)



(* end of [BUCASCS320-2023-Spring-mysmlib-ind.sml] *)
fun
ref_for_all(refs: 'a ref, test:('a -> bool)):bool = 
test(!refs);

fun
ref_get_at
(refs: 'a ref, i0:int): 'a =
if i0 = 0 then ! refs else raise Subscript;

fun
ref_map_list
(refs: 'a ref, fopr: ('a) -> 'b): 'b list =
	let val beta = fopr(!refs)
	in [beta]
	end;

fun
ref_foldleft
(refs: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r =
fopr(res, !refs);

fun
ref_ifoldleft
(refs: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r =
fopr(res, 0, !refs);

fun helper(ixs, r0) = 
	(case ixs of nil => nil	| ix1::ixs => 
	case ix1() of strcon_nil => nil |
	strcon_cons(hds, tls) => r0 @ hds @ helper(ixs, r0)
);


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


fun power_tri(x:int):int stream =
fn() =>
let
fun helper(i0:int): int strcon=
	strcon_cons(i0*i0*i0, fn() => helper(i0+1)) 
in
helper(x)	
end; 