(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)

(* ****** ****** *)
type board_t = int * int * int * int * int * int * int * int

fun is_valid (board: board_t) : bool =
    let
        fun no_threat (x,y) [] = true
        |   no_threat (x,y) ((a,b)::xs) =
                if x = a orelse y = b orelse x + y = a + b orelse x - y = a - b then false
                else no_threat (x,y) xs
    in
        no_threat (1, #1 board) (List.tabulate(8, fn i => (i+1, #i board)))
    end

fun place_queen (col, row, board) : board_t =
    let
        fun place (0, acc) = acc
        |   place (n, acc) =
                let
                    val new_board = List.tabulate(8, fn i =>
                        if i = n-1 then row else #i acc
                    )
                in
                    if is_valid new_board then place (n-1, new_board)
                    else place (n-1, acc)
                end
    in
        place (8-col, board)
    end

fun queen8_puzzle_solve () : board_t list =
    let
        fun solve (col, board, acc) =
            if col > 8 then board :: acc
            else
                let
                    val boards = List.map (fn i => place_queen(col, i, board)) (List.tabulate(8, fn i => i+1))
                in
                    foldl (fn (b, a) => solve(col+1, b, a)) acc boards
                end
    in
        solve (1, ([],[],[],[],[],[],[],[]), [])
    end

(* end of [CS320-2023-Spring-assign04-04.sml] *)
