"./../../../mysmlib/mysmlib-cls.sml";
fun quiz02_01 (word: string) : (char -> int) =
  let
    val strlen = fn s => foldl (fn (_, n) => n + 1) 0 s
    val strsub = fn s => fn i => String.sub (s, i)
    val count_char = fn c => fn s => foldl (fn (x, n) => if x = c then n + 1 else n) 0 s
  in
    count_char
  end



val count1 = quiz02_01("$abb*cccdddd") (#"1")


    