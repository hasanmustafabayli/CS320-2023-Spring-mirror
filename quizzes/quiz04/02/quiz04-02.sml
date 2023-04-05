(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-02
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)


(* ****** ****** *)
fun stream_dupremov(fxs: int stream) =
    let
        fun helper(values: int, x: int) =
            if values <> 0 then
                if stream_get_at(fxs, values - 1) <> x then true else false
            else
                true
    in
        stream_make_ifilter(fxs, fn(values, x) => helper(values, x)) 
    end






(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)

