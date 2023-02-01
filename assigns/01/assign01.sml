(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
use "./assign01-lib.sml";
(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)

(* ****** ****** *)

(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the length of an xlist DIRECTLY:
//
fun xlist_len(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the length of the converted list

fun 
xlist_size(xs: 'a xlist) : int =
(
case xs of
xlist_nil => 0
|
xlist_cons(x1, xs) => 1 + xlist_size(xs)
|
xlist_snoc(xs, x1) => 1 + xlist_size(xs)
|
xlist_append(xs, ys) => xlist_size(xs) + xlist_size(ys)
|
xlist_reverse(xs) => xlist_size(xs)
)

//
*)

(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the Subscript exception.
//
You should NOT convert xlist into list
and then compute the length of the converted list
//

 fun xlist_sub(xs:'a xlist, i0: int): 'a=
 if i0 >= xlist_size(xs) then raise Subscript
 else
 (
 case xs of
 xlist_cons(x1, xs) => (case i0 of 0 => x1 | i0 => xlist_sub(xs, i0 - 1))
 |
 xlist_snoc(xs, x1) => (case (i0 = xlist_size(xs)) of true => x1 | false => xlist_sub(xs, i0))
 |
 xlist_append(xs,ys) => (case (i0 < xlist_size(xs)) of true => xlist_sub(xs, i0) | false => xlist_sub(ys, i0 -xlist_size(xs)))
 |
 xlist_reverse(xs) => xlist_sub(xs, xlist_size(xs) - i0 - 1)
 |
 xlist_nil => raise Subscript
 );

*)

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'mylist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'mylist_reverse'
3. 'xs' and 'ys' use the same number of 'mylist_append'
//

fun xlist_remove_aid(xs:'a xlist): 'a xlist =
(
case xs of
xlist_nil => xlist_nil
|
xlist_cons(x1, xs) => xlist_cons(x1, xlist_remove_aid(xs))
|
xlist_snoc(xs, x1) => xlist_snoc(xlist_remove_aid(xs), x1)
|
xlist_append(xs, ys) => xlist_append(xlist_remove_aid(xs), xlist_remove_aid(ys))
|
xlist_reverse(xs) => xlist_remove_aid(xs)
);

fun xlist_remove_reverse(xs:'a xlist): 'a xlist =
	val xs = xlist_remove_aid(xs);

*)
  
(* ****** ****** *)

(*
//
Assign01-04: 20 points
//
Please implement a function that checks DIRECTLY
if a given int xlist is sorted/ordered ascendingly:
//
fun xlist_sortedq(xs: int xlist): bool
//
You should NOT convert xlist into list
and then check whether the converted list is sorted.

val strsub = String.sub;
val ord = Char.ord;
val strlen = String.size;

fun ch_legal(chr: char): int = 
	if (ord(chr) >= 48) = (ord(chr) <= 57) then 0
	else 1;

fun is_legal(cs: string, cur: int, sum:int): int = 
	if (strlen(cs) > cur) then is_legal(cs, cur+1, ch_legal(strsub(cs, cur)) + sum)
	else sum;

fun power(len: int) : int = 
	if len > 0 then power(len -1) * 10 
	else 1;

fun restr2int(cs: string, chr: char, dgt: int, posn: int): int = 
	if dgt > 1 then
	restr2int(cs, strsub(cs, posn + 1), dgt - 1, posn + 1) + (ord(chr) - 48) * power(dgt - 1)
	else ord(chr) - 48; 


fun str2int(cs: string): int option = 
	if is_legal(cs, 0, 0) > 0 then NONE
	else SOME(restr2int(cs, strsub(cs, 0), String.size(cs), 0));
//
*)
  

  
(* ****** ****** *)

(*
//
Assign01-05: 20 points
//
// The permutations of 0,1,2 can be ordered
// according to the lexicographic ordering as follows:
//
// (0,1,2) < (0,2,1) < (1,0,2) < (1,2,0) < (2,0,1) < (2,1,0)
//
// This ordering can be readily generalized to the permutations
// of n numbers, which n is positive. Given a permutation xs of
// the first n natural numbers, next_permuation(xs) returns the next
// permutation following xs if it exists, and None0() otherwise.
//
// examples:
//
// permute_next_exn( [1,0,2] ) = [1,2,0]
// permute_next_exn( [2,1,0] ) = raise(LastPermExn)
// permute_next_exn( [2,10,3,8,4,1,0,6,9,7,5] ) = [2,10,3,8,4,1,0,7,5,6,9]
//
// permute_next_opt( [1,0,2] ) = Some0( [1,2,0] )
// permute_next_opt( [2,1,0] ) = None0()
// permute_next_opt( [2,10,3,8,4,1,0,6,9,7,5] ) = Some0( [2,10,3,8,4,1,0,7,5,6,9] )
//
*)
(*
//
exception LastPermExn
//
fun
permute_next_exn(xs: int list): int list
//
fun
permute_next_opt(xs: int list): (int list) optn
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01.sml] *)
