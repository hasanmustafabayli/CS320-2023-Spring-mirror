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

(*
val the_ln2_stream: real stream = fn() => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)

(* Define a function to compute the nth partial sum of ln 2 *)




val the_ln2_stream: real stream = fn() =>
  let
    fun helper(n:int):real stream =
        case n mod 2 = 0 of
            true => stream_cons(~1.0/Real.fromInt(n), helper(n+1))
            |false => stream_cons(1.0/Real.fromInt(n),  helper(n+1))
  in
    strcon_cons(1.0, helper(1))
  end;


(*strcon_cons(1.0, fn() => strcon_cons(1.0, fn() => strcon_nil))
stream_cons(1.0, fn() => stream_cons(1.0, fn() => stream_nil))*)

