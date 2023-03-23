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
