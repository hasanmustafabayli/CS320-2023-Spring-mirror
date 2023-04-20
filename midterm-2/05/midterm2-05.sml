(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of xs satisfying
c < a < b. Note that a, b, and c do not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231(xs: int list): bool = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05.sml] *)
fun
perm_capture_231(xs: int list): bool = 
let 
    fun helper1(a, xs): bool = 
        case list_forall(xs, fn(b) => b > a) of
            true => false
            |false => true

    fun helper2(a, xs): bool = 
        case list_forall(xs, fn(c) => c > a) of
            true =>false
            |false => true

in
case xs of 
nil => false
| ul::xs => 
  case xs of 
    nil => false
 | ul2::xs => 
  if helper1(ul, ul2::xs) andalso helper2(ul, xs) then true
  else perm_capture_231(ul2::xs) 

end


