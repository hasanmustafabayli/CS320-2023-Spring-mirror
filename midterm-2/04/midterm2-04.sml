(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// an infinite stream fxs of integers and returns a stream
// enumerating all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_drawdowns(fxs: int stream): int list stream = ... *)

(* ****** ****** *)


(* end of [CS320-2023-Spring-midterm2-04.sml] *)


fun
stream_drawdowns(fxs: int stream): int list stream = 
    let
        fun helper(xs:int list, fxs: int stream): int list stream = fn() =>
    case fxs() of
        strcon_nil => strcon_nil
        |strcon_cons(val1, val2) =>
    case xs of 
    nil => helper([val1], val2)()
    | ul::ulu => 
        case (val1<=ul) of
            true => helper(val1::xs, val2)() 
            |false => strcon_cons(list_reverse(xs), helper([val1], val2))
    in
    helper([], fxs)
    end

