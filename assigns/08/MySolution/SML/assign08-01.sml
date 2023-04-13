(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

fun stream_permute_list(xs: 'a list): 'a list stream =
    let 
        fun helper(a: 'a, ys: 'a list): 'a list stream = fn() =>
            case (a, ys) of
                (y, nil) =>  (* base case: if the input list is empty, return a stream containing just the single element y *)
                    strcon_cons([y], stream_nil())
                |(y, val1::val2) =>  (* recursive case: if the input list is non-empty, insert y between every pair of adjacent elements in the list *)
                    strcon_cons((y :: val1 :: val2), stream_make_map(helper(y, val2), fn(newpar) => val1 :: newpar))
        in
            case xs of
            [] => stream_cons([], stream_nil())  (* base case: if the input list is empty, return a stream containing just the empty list *)
            |x :: xs => stream_concat(stream_make_map(stream_permute_list(xs), fn(newpar) => helper (x,newpar)))
                (* recursive case: if the input list is non-empty, split it into its first element x and the rest of the list xs, 
                   recursively permute the rest of the list xs to get a stream of all permutations of xs without x,
                   then for each permutation in the stream, insert x into every possible position and concatenate the resulting streams *)
        end



(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)
