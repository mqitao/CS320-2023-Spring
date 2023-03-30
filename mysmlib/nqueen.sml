(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-16: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(if n0 mod i0 = 0 then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end
*)

(* ****** ****** *)

val
isPrime =
fn(n0: int) =>
n0 >= 2
andalso
int1_forall
(n0, fn(i0) => (i0 < 2 orelse (n0 mod i0 <> 0)))

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-01.sml] *)

(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-02-16: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)

(*
val
list_subsets =
fn(xs: 'a list) => ...
*)

(* ****** ****** *)

val
list_subsets =
fn(xs: 'a list) => list_foldleft(xs, [[]], fn(res, x1) => list_append(res, list_map(res, fn(xs) => x1 :: xs)))

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-02.sml] *)
(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Assign04-03:
HX-2023-02-16: 10 point
//
There is a concept 'exists'
that is dual to the concept of 'forall'.
//
Recall that a forall function takes a sequence
and a predicate (that is, a test function) and
checks whether all the elements satisfy the predicate.
//
A exists function takes a sequence and a predicate
and checks if there is an element in the sequence that
satisfies the predicate.
//
Please implement the following third-order
function that turns a forall function into
an exists function
//
fun
forall_to_exists
(forall: ('xs,'x0)forall_t): ('xs,'x0)exists_t
//
*)

(* ****** ****** *)
type
('xs, 'x0) forall_t =
'xs * ('x0 -> bool) -> bool
type
('xs, 'x0) exists_t =
'xs * ('x0 -> bool) -> bool
(* ****** ****** *)

val
forall_to_exists =
fn
(forall: ('xs,'x0)forall_t) =>
(
fn
( xs: 'xs
, test: 'x0 -> bool) =>
  not(forall(xs, fn(x0) => not(test(x0))))): ('xs,'x0)exists_t

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-03.sml] *)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)

(* ****** ****** *)
val N = 4
(* ****** ****** *)

type
int8 =
int*int*int*int
*
int*int*int*int
type board_t = int8

(* ****** ****** *)

val
board_foreach =
fn
( bd: board_t
, work: int -> unit) =>
let
val
(x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
work(x0); work(x1);
work(x2); work(x3);
work(x4); work(x5); work(x6); work(x7)
end

(* ****** ****** *)

val
board_get_at =
fn(bd: board_t, i: int) =>
foreach_to_get_at(board_foreach)(bd, i)
val
board_tabulate =
fn(f: int -> int) =>
(f(0), f(1), f(2), f(3), f(4), f(5), f(6), f(7))
val
board_fset_at =
fn(bd: board_t, i: int, p: int) =>
board_tabulate
(fn(j) => if i = j then p else board_get_at(bd, j))

(* ****** ****** *)

val
board_safety =
fn(bd, i) =>
let
val pi =
  board_get_at(bd, i)
val
helper =
fn(j) =>
let
  val pj =
  board_get_at(bd, j)
in
  pi <> pj andalso
  (abs(i-j) <> abs(pi-pj))
end
in
  int1_forall(i, fn j => helper(j))
end

(* ****** ****** *)
val
int1_map_list =
fn(xs, fopr) =>
foreach_to_map_list(int1_foreach)(xs, fopr)
(* ****** ****** *)
val
board_extend =
fn(bd: board_t, i: int) =>
list_filter
(int1_map_list
 (N, fn(p) => board_fset_at(bd, i, p+1)), fn(bd) => board_safety(bd, i))
(* ****** ****** *)
val
queen8_puzzle_solve =
fn() =>
int1_foldleft
( N, [board_tabulate(fn _ => 0)]
, fn(bds, i) => list_concat(list_map(bds, fn(bd) => board_extend(bd, i))))
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)