(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_take
(fxs: 'a stream, n: int): 'a stream = ...
*)

(* ****** ****** *)

(*
fun
stream_drop
(fxs: 'a stream, n: int): 'a stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00.sml] *)


fun stream_take(fxs: 'a stream, n: int): 'a stream = 

    let
        fun helper(ys: 'a strcon, newint: int): 'a strcon =
             
             case (ys, newint) of
                (_, 0) => strcon_nil
                 | (strcon_nil, _) => strcon_nil
                 | (strcon_cons(val1, val2), _) => strcon_cons(val1, fn () => helper(val2(), newint-1))
    in
            fn () => helper(fxs(), n)
    end

(* ****** ****** *)


fun stream_drop(fxs: 'a stream, n: int): 'a stream = 

let
    fun helper(val1: 'a stream, newint: int): 'a strcon =
      case (newint <= 0) of  
        true => val1()
        |false => helper(stream_tail(val1), newint-1)
  in
    fn () => helper(fxs, n)
  end