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

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-01.sml] *)

(*fun stream_ziplst(ls: 'a stream list): 'a list stream =
    let
        fun helper(news: 'a stream list, x:int, y:int): 'a stream =fn() =>
            
            case (y = list_length(news) -1) of
                 true =>  strcon_nil 
                | false => strcon_cons(stream_get_at(list_get_at(news,y),x),  stream_append(helper(news,x,y+1),  helper(news, x+1, 0)))
                
    in
        helper(ls, 0,0)
    end*)


val newstream = stream_cons([1,2,3], fn() => strcon_nil)
val strcon_cons(elem, fxs) = newstream()
val hasan2 = elem
val test1 = stream_get_at(newstream,0)
    
val newstream2 = stream_cons([4,5,6], fn() => strcon_nil)
val strcon_cons(elem2, fxs2) = newstream()
val newhasan = fxs2
val newlist2 = [] @ [fxs2]
val strconhasan = strcon_cons([1,2,3], fn() => strcon_nil)
val strconhasan2 = strcon_cons([4,5,6], fn() => strcon_nil)

val newlist = [strconhasan,strconhasan2]
val hasan = list_get_at(newlist, 0)

val huseyn =[[1,2,3],[4,5,6], [7,8,9]]
val gulsha = list_length(huseyn)


fun stream_ziplst(ls: 'a stream list): 'a list stream =
    let
        fun helper(lscopy: 'a stream list, rownum: int, listlength: int, newlist: 'a list, alist: 'a list): 'a stream = fn() =>
            case rownum = listlength of 
                true => stream_cons(newlist, helper(huseyn,0,listlength,nil,nil))
                |false =>helper(lscopy, rownum+1, listlength, newlist, huseyn)
            val outlist = hasan list_get_at(lscopy, rownum)
            val strcon_cons(elem, fxs) = outlist()
            val listof1stream = elem::newlist
            val huseyn = alist @ [fxs]

    
             (*true => strcon_cons(listof1stream, fn() => helper(huseyn,0,listlength,[],[]))
             |false => helper(lscopy, rownum+1, listlength, listof1stream, huseyn))*)
        
    in
        helper(ls, 0, list_length(ls),[],[])
    end
     