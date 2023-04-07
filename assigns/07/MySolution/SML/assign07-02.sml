(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () =>
//
*)

fun
stream_merge2
( fxs1: 'a stream
, fxs2: 'a stream
, lte3: 'a * 'a -> bool): 'a stream = fn() =>
(case fxs1() of
  strcon_nil => fxs2()
| strcon_cons(x1, fxs1) =>
(
case fxs2() of
strcon_nil =>
strcon_cons(x1, fxs1)
|
strcon_cons(x2, fxs2) =>
if
lte3(x1, x2)
then strcon_cons
(x1, stream_merge2(fxs1, stream_cons(x2, fxs2), lte3))
else strcon_cons
(x2, stream_merge2(stream_cons(x1, fxs1), fxs2, lte3))
)
)

fun lte3(v1:(int * int), v2:(int * int)): bool = 
    let
        val val1 = (#1(v1)*(#1(v1))*(#1(v1))) + (#2(v1)*(#2(v1))*(#2(v1)))
        val val2 = (#1(v2)*(#1(v2))*(#1(v2))) + (#2(v2)*(#2(v2))*(#2(v2)))
    in 
        val1 <= val2
    end
fun te_stream(x: int, y: int): (int * int) stream = fn() => 
strcon_cons((x,y), te_stream(x, y+1))
fun helper(i: int): (int *  int) stream = fn() => 
strcon_cons((0,i), stream_merge2(te_stream(i,i) , helper(i+1), lte3))
val theNatPairs_cubesum: (int * int) stream = fn() =>
stream_cons((0,0), helper(1)) ()