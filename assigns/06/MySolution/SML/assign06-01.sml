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
    fun helper(n:real, totalsum:real):real strcon =
        case Real.floor(n) mod 2 = 0 of
            true => strcon_cons(totalsum+ (~1.0/n),fn() => helper(n+1.0, totalsum+ (~1.0/n)))
            |false => strcon_cons(totalsum+ (1.0/n), fn() => helper(n+1.0, totalsum+ (1.0/n)))
  in
     helper(1.0, 0.0)
  end;


(*strcon_cons(1.0, fn() => strcon_cons(1.0, fn() => strcon_nil))
stream_cons(1.0, fn() => stream_cons(1.0, fn() => stream_nil))*)


(*val the_ln2_stream: real stream = 
  let
    fun helper(new:int, total: real) = fn() =>
        if new mod 2 = 0 then
            strcon_cons(total + (~1.0/Real.fromInt(new)), fn() => helper(new + 1, total + ~1.0/Real.fromInt(new) ))
        else 
            strcon_cons(total + (1.0/Real.fromInt(new)), fn() => helper(new + 1, total + 1.0/Real.fromInt(new) ))
  in
    helper(1, 0.0)
  end*)





