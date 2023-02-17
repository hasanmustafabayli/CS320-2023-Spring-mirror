(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)
fun list_longest_ascend(xs: int list): int list =
 case xs of
   [] => []
 | x1 :: xs' =>
     let
       fun remove_less(lst, n) =
         case lst of
           [] => []
         | x :: xs'' =>
             if x < n then remove_less(xs'', n)
             else x :: remove_less(xs'', x)
       val res1 = x1 :: remove_less(xs', x1)
       val res2 = list_longest_ascend(xs')
     in
       if length res1 >= length res2 then res1
       else res2
     end

	  




































