use
"./../../../mysmlib/mysmlib-cls.sml";

fun abs(x: int) = if x >= 0 then x else ~x

fun quiz02_02(xs: int list, ys: int list) : bool =
  let
    fun checkPair(x: int, y: int) : bool = abs(x - y) < 10
    fun checkList(xs: int list, y: int) : bool =
      case xs of
        [] => false
      | x::xs' => checkPair(x, y) orelse checkList(xs', y)
  in
    case ys of
      [] => false 
    | y::ys' => checkList(xs, y) orelse quiz02_02(xs, ys')
  end

val test1 = quiz02_02([1, 2, 3], [12, 13, 14])

val test2 = quiz02_02([1, 2, 3], [22, 23, 24])
(* expected result: false *)

val test3 = quiz02_02([], [12, 13, 14])
(* expected result: false *)

val test4 = quiz02_02([1, 2, 3], [])

(* expected result: false *)

val test5 = quiz02_02([1, 2, 3, 4, 5], [15,20,30,40, ~8])
val test6 = quiz02_02([1, 2, 3, 4, 5], [15,20, 30, 40, 50])
val test7 = quiz02_02([], [1,2,3])

