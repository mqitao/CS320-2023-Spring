(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01
*)

val theAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

fun alphabeta_cycling_list(): char stream=
fn() =>
let
val list = string_listize("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
in 
    let
    fun helper(x, i): 'a strcon=  
    case i >= 26 of true => 
    strcon_cons(list_get_at(x, 0), fn() => 
    helper(x, 1))
    | false => 
    strcon_cons(list_get_at(x, i), fn() => 
    helper(x, i+1))
    
    in helper(list, 0)
    end
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)