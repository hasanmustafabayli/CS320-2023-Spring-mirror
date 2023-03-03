(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
int2real
coerces an int into a real:
*)
val int2real = Real.fromInt
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list of reals xs, list_averages(xs)
returns another list ys of reals such that:
ys[0] = xs[0] / 1.0
ys[1] = (xs[0] + xs[1]) / 2.0
ys[2] = (xs[0] + xs[1] + xs[2]) / 3.0
In general, ys[i] is the average of the first
(i+1) elements in xs.
//
For instance,
list_averages([]) = []
list_averages([1.0,2.0,3.0]) = [1.0,1.5,2.0]
list_averages([1.0,2.0,3.0,4.0]) = [1.0,1.5,2.0,2.5]
//
Note that you are allowed to define recursive
functions in your implementation of list_averages.
//
*)
(* ****** ****** *)
(*
fun
list_averages(xs: real list): real list = ...
*)
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_averages.sml] *)
fun list_averages(xs: real list) =
    let
        fun total(acc: real list, new:real) =
        case acc of
            nil => list_extend(acc, new)
            |_ => list_extend(acc, new+list_get_at(acc, list_length(acc) -1))
        
        fun increment(new:int) =
            int2real(new) + 1.0

        fun denominator(ys:real list) =
            list_map(int1_listize(list_length(ys)), increment)

        fun denominator2(new:real, new2:real) =
            new/new2
    in
        list_z2map(list_reduce_left(xs, [], total), denominator(xs), denominator2)
    end;




