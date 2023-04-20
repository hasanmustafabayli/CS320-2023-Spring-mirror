(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-04-20:
Given a finite or infinite stream fxss of
infinite streams: fxs_0, fxs_1, fxs_2, ...,
stream_zipstrm(fxss) returns an infinite stream
of streams: gxs_0, gxs_1, gxs_2, ..., where we have
gxs_j[i] = fxs_i[j]. Note that this is just the
stream version of stream_ziplst (see Assign07-01).
*)
(* ****** ****** *)

(*
fun
stream_zipstrm
( fxss
: 'a stream stream): 'a stream stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-03.sml] *)

(*
fun index_valid_helper(strm: 'a stream, i: int, j: int): bool =
   if j < i then
       case strm() of strcon_nil => false
       |
       strcon_cons(s1,strm) => index_valid_helper(strm, i, j+1)
   else true


fun index_valid(fxss: 'a stream stream, i: int): bool =
   stream_forall(fxss, fn(strm) => index_valid_helper(strm, i, ~1))


fun make_stream2(fxss: 'a stream stream, i: int): 'a stream =
   fn() =>
   case fxss() of strcon_nil => strcon_nil
   |
   strcon_cons(fx1, fxss) =>
       case fx1() of strcon_nil => strcon_nil
       |
       strcon_cons(x1, fx1) => strcon_cons(stream_get_at(fn() => strcon_cons(x1, fx1), i), make_stream2(fxss, i))


fun make_stream(fxss: 'a stream stream, i: int): 'a stream stream =
   fn() =>
   if index_valid(fxss, i) then strcon_cons(make_stream2(fxss, i), make_stream(fxss, i+1))
   else strcon_nil


fun stream_zipstrm(fxss: 'a stream stream): 'a stream stream =
   fn() =>
   case fxss() of strcon_nil => strcon_nil
   |
   strcon_cons(fx1, fxss) => make_stream(stream_cons(fx1, fxss), 0)()

*)

