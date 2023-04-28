(* ****** ****** *)
(*
HX-2023-04-15: 10 points
*)
(* ****** ****** *)

(*
Please *translate* the following function
list_merge2 into list_kmerge2, where the latter
is of the so-called continuation-passing style (CPS)
*)

(* ****** ****** *)

(*
fun
list_merge2
(xs1: int list
,xs2: int list): int list =
(
case xs1 of
  nil => xs2
| x1 :: xs1 =>
(
case xs2 of
  nil => x1 :: xs1
| x2 :: xs2 =>
  if
  (x1 <= x2)
  then x1 :: list_merge2(xs1, x2 :: xs2)
  else x2 :: list_merge2(x1 :: xs1, xs2)
)
)
*)

(* ****** ****** *)

(*
fun
list_kmerge2
(xs1: int list
,xs2: int list, ret: int list -> 'a): 'a = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-01.sml] *)

fun list_kmerge2(xs1: int list, xs2: int list, ret: int list -> 'a): 'a =
  case xs1 of
    nil => ret xs2          (* if xs1 is empty, return xs2 *)
  | x1 :: xs1' =>            (* otherwise, pattern match on xs1 *)
    case xs2 of
      nil => ret (x1 :: xs1')  (* if xs2 is empty, return xs1 with x1 prepended *)
    | x2 :: xs2' =>           (* otherwise, pattern match on xs2 *)
      if x1 <= x2 then        (* if x1 is less than or equal to x2 *)
        list_kmerge2(xs1', xs2, fn ys => ret (x1 :: ys))  (* recursively call list_kmerge2 with xs1' and xs2, and a continuation that prepends x1 to the result *)
      else                    (* otherwise *)
        list_kmerge2(xs1, xs2', fn ys => ret (x2 :: ys))  (* recursively call list_kmerge2 with xs1 and xs2', and a continuation that prepends x2 to the result *)






