####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################
def mylist_mergesort(xs):
    if mylist_nilq(xs) or mylist_nilq(xs.cons2):
        return xs

    def split(xs):
        if mylist_nilq(xs):
            return (mylist_nil(), mylist_nil())
        elif mylist_nilq(xs.cons2):
            return (mylist_cons(xs.cons1, mylist_nil()), mylist_nil())
        else:
            sik = split(xs.cons2.cons2)
            return (mylist_cons(xs.cons1, sik[0]), mylist_cons(xs.cons2.cons1, sik[1]))

    def merge(ms, ls):
        if mylist_nilq(ms):
            return ls
        elif mylist_nilq(ls):
            return mylist_cons(ms.cons1, ms.cons2)
        elif ls.cons1 >= ms.cons1:
            return mylist_cons(ms.cons1, merge(ms.cons2, mylist_cons(ls.cons1, ls.cons2)))
        else:
            return mylist_cons(ls.cons1, merge(mylist_cons(ms.cons1, ms.cons2), ls.cons2))

    value = split(xs.cons2.cons2)
    return merge(mylist_mergesort(mylist_cons(xs.cons1, value[0])), mylist_mergesort(mylist_cons(xs.cons2.cons1, value[1])))
