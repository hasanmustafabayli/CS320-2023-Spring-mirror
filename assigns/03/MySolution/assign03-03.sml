(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)
fun list_tabulate(n: int, f: int -> 'a): 'a list=
  let
    fun tabulate(i) =
      if i = n then []
      else (f i) :: tabulate(i + 1)
  in
    tabulate(0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
