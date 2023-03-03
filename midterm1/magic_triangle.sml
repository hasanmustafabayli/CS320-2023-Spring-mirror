(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-04: 10 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the
  numbers in the row directly above it.

The following example shows how row 5 is computed from row 4.

row 4:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 5:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ???

Hint: You might want a helper function to compute the current row from
the previous.

*)

(* ****** ****** *)

(*
fun
magic_triangle (n : int) : int list list = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)
fun enumerate_list(xs: 'a list): (int * 'a) list =
  list_zip2(int1_listize(list_length(xs)), xs);

fun helper(current_values: int list): int list =
  [hd(current_values)] @ list_map(
    list_zip2(int1_listize(list_length(current_values)), current_values),
    fn(x) => if #1(x) + 1 = list_length(current_values) then 1
              else #2(x) + list_get_at(current_values, #1(x) + 1)
  );

fun magic_triangle(n: int): int list list =
  list_foldleft(list_tabulate(n + 1, fn(x) => x), [[1]],
    fn(acc, x) =>
      if x = 0 then acc
      else if x = 1 then rev([1, 1]::acc)
      else acc @ [helper(hd(rev(acc)))]
  );


magic_triangle 0

magic_triangle 0
