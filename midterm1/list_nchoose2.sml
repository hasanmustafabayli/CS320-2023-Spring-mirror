(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)

(*
fun
list_nchoose2(xs: int list): (int * int) list = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)

fun list_nchoose2(xs: int list): (int * int) list =
    let
        fun helper(res:(int *int) list, xs: int list, i:int): (int * int) list =
            if i = list_length(xs) then res
            else 
                let 
                    val curr = list_get_at(xs,i);
                in 
                    helper(list_append(res, list_reduce_left(xs, [], fn(r0,x) => if curr < x then (curr, x)::r0 else r0)), xs, i+1)
                end
    in
        helper([],xs, 0)
    end;

list_nchoose2([1,3,2])