(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)

fun find_root(f0: int -> int): int =
    let
        fun helper(n: int): int =
            if f0(n) = 0 then n
            else if n = 0 then helper(n+1)
            else if n > 0 then helper(n-2*n)
            else helper((n* ~1) + 1)
    in
        helper(0)
    end;



(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01.sml] *)