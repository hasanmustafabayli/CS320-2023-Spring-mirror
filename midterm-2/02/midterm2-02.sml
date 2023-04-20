(* ****** ****** *)

use "./../../mysmlib//mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
The mytree datatype is defined as follows.
Each node in mytree contains a stored element
plus a list of children, where the list can be
empty.
//
Please implement a function mytree_dfs_streamize
that enumerates a given mytree in a depth-first manner.
//
*)
(* ****** ****** *)

datatype 'a mytree =
  mytree_node of 'a * ('a mytree list)

(* ****** ****** *)

(*
fun
mytree_dfs_streamize(t0: 'a mytree): 'a stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-02.sml] *)


fun mytree_dfs_streamize(t0: 'a mytree): 'a stream =
    let
        fun hasan(mytree_node(x, children)) =
            let
                fun lchildren(children) =
                    case children of
                        [] => stream_nil()
                      | t::ts => stream_append(mytree_dfs_streamize(t), lchildren(ts))
            in
                stream_cons(x, fn () => lchildren(children)())
            end
    in
        hasan(t0)
    end

