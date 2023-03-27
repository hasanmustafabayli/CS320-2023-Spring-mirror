(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)


(* Define a function to compute the nth pair *)


fun theNatPairs() =
  let
    fun pairsFrom(i, j) = stream_cons((i, j), pairsFrom(i+1, 0))
  in
    strcon_cons((0,0), pairsFrom(1,0))
  end

