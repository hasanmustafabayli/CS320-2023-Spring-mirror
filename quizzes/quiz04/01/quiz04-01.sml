(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01

Give a stream fxs, strem_duperov(fxs) returns anpther stream that enumreates every element in fxs that is not precede by the same element;
For instance, if xs = [1,1,2,2,3,3]
stream_dupremov(xs) enumerates [1,2,3]
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)

fun alphabeta_cycling_list(): char stream = 
    let
    val theAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    fun streamproduc(newlist: char list, x: int): char stream = fn () => 
    strcon_cons(list_get_at(newlist, (x mod 26)), streamproduc(newlist, (x mod 26) + 1))
in
  streamproduc(string_listize(theAlphabet), 0)
end


