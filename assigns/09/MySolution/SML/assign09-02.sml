(* ****** ****** *)
use "./../../MySolution/SML/generator.sml";
(* ****** ****** *)
use "./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
There is an implementation of infinite generators
in [generator.sml]. Please study the implementation.
How do you use it to give an implementation of generators
that are possibily finite?
*)

(* ****** ****** *)

type 'a fgenerator = 'a option generator

(* ****** ****** *)

(*
//
HX-2023-04-15: 20 points
//
Please implement the following function that converts
a stream into a generator that is possibly finite.
(*
There is not much code to write here; the problem mainly
test your understanding of continuations.
*)
//
fun
fgenerator_make_stream(fxs: 'a stream): 'a fgenerator = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-02.sml] *)

type 'a fgenerator = 'a option generator

(* Define a function 'fgenerator_make_stream' that takes a stream 'fxs' of type 'a' and returns an 'fgenerator' of type 'a'. *)
fun fgenerator_make_stream (fxs : 'a stream) : 'a fgenerator =
  (* Define a local function 'helper' that takes a stream 'yxs' of type 'a', and two handles 'h1' and 'h2' that correspond to the generator's state. This function returns an 'option' value of type 'a'. *)
  let
    fun helper(yxs: 'a stream, h1, h2): 'a option =
      (* Use pattern matching on the 'yxs' stream to check if it's empty. *)
      case yxs() of 
         strcon_nil => 
         (* If the 'yxs' stream is empty, yield 'NONE' using the 'generator_yield' function and return 'NONE'. *)
         let 
            val () = generator_yield(NONE, h1, h2) 
         in 
            NONE 
         end
        (* If the 'yxs' stream is not empty, extract the head 'y' and the tail 'ys'. *)
        |strcon_cons(y,ys) =>
          (* Yield 'SOME(y)' using the 'generator_yield' function, and then recurse on the tail 'ys'. *)
          let
            val () =
               generator_yield(SOME(y), h1, h2)
          in 
            helper(ys, h1,  h2)
          end
  (* Return a new generator using the 'generator_make_fun' function that takes a function as input. The input function takes a new value 'newval' and a list of handles 'nls' and returns the result of calling 'helper' with the 'fxs' stream, 'newval', and 'nls' handles. *)
  in
    generator_make_fun(fn(newval, nls) => helper(fxs, newval, nls))
  end

