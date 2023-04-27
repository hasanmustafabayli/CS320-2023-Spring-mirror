(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(*fun
stream_ziplst(ls: 'a stream list): 'a list stream =
    let
        fun helper(lst: 'a stream list, new: 'a list, x: int): 'a list stream =
            case lst of
                nil => stream_cons(nil, fn() => strcon_nil)
                |hd::nil => case hd() of 
                                strcon_nil => stream_cons([]::newlist, fn() => helper(ls, [], 0))
                                |strcon_cons(val, val1) =>

                |hd::tl => case hd of *)
        


fun stream_ziplst(lst: 'a stream list): 'a list stream = 
    let  
        fun newcol(lst: 'a stream list): 'a list =
            case lst of 
                [] => []
                |elem::telem =>
                    case elem() of 
                        strcon_nil => []
                        |strcon_cons(val1, val1s) => val 1 :: newcol(telem)
        fun newstream(lst: 'a stream list): 'a stream list =
            case lst of
                [] => []
                |elem::telem =>
                    case elem() of 
                        strcon_nil => []
                        |strcon_cons(val1, val1s) => val1s :: newstream(telem)

    in  
     case list_length(lst) <> list_length(newstream(lst)) of 
        true => stream_nil()
        |false => fn () => strcon_cons(newcol(lst), stream_ziplst(newstream(lst)))

    end
(* ****** ****** *)

