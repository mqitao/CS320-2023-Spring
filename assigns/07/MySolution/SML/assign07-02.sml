(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () =>
//
*)
fun get_next(valu:(int*int)):(int*int) =
let val (v1, v2) = valu
in 
case v1 >= v2 of true => (0, v2+1)
| false => (v1+1, v2)	

end

fun cube_sum(x:(int*int),y:(int*int)): bool =
let 
val (x1, x2) = x
val (y1, y2) = y
in 
(x1*x1*x1+x2*x2*x2) <= (y1*y1*y1+y2*y2*y2)
end

fun get_row(x:(int*int)): (int*int) =
 let val (x0, x1) = x
 in (0, x1+1)
 end  

fun fn_next(x:(int*int), nx_r:(int*int), goal:(int*int)): (int*int)  list =
	(case cube_sum(goal, x) of true => [goal] @ [x]
    | false => 
      (case cube_sum(goal, nx_r) of true => 
       [x] @ fn_next(get_next(x), get_row(x), goal)
      | false => 
        (case cube_sum(get_next(x), nx_r) of true => 
         [x] @ fn_next(get_next(x), get_row(x), goal)
        | false => 
          [x] @ fn_next(nx_r, get_row(nx_r), goal)
      )
    )
  );
		
fun recur(x:(int*int)): (int*int) stream =
 list_streamize( tl(fn_next(x, get_row(x), get_next(x))) )


fun recur_vis(x:(int*int)): (int*int) list =
  fn_next(x, get_row(x), get_next(x))  

fun recur_filt(x:(int*int)):(int*int) list = 
list_filter(recur_vis(x), fn(xi) => cube_sum(x, xi) );  

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-02.sml] *)
