(* ****** ****** *)
use "./../../MySolution/SML/assign09-02.sml";
(* ****** ****** *)

fun
fgenerator_next(fgen) =
(
case generator_next(fgen) of
  NONE =>
  raise StopIteration | SOME(x1) => x1
)

(* ****** ****** *)

fun
fgenerator_foreach
(fgen: 'a fgenerator, work: 'a -> unit) =
work(fgenerator_next(fgen)) handle StopIteration => ()

(* ****** ****** *)

val ans1 =
foreach_to_forall
(fgenerator_foreach)
(fgenerator_make_stream(stream_tabulate(10, fn i => i+1)), fn i => i > 0)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-02.sml] *)
