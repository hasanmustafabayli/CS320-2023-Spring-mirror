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
        fun function1(newval:(int *int) list, ys: int list, b:int): (int * int) list =
            case  b = list_length(ys) of
                true => newval
                |false =>
                let 
                    val temp = list_get_at(ys,b);
                in 
                    function1(list_append(newval, list_foldleft(ys, [], fn(manq,x) => if temp < x then (temp, x)::manq else manq)), ys, b+1)
                end
    in
        function1([],xs, 0)
    end;
