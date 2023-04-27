####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#
def word_neighbors(word):
    def AB():
        return "abcdefghijklmnopqrstuvwxyz"
    def replace_char_at(s, index, c):
        return s[:index] + c + s[index+1:]

    wlen = len(word)
    return fnlist_concat(
        string_imap_fnlist(word, lambda i, c:
            fnlist_concat(
                string_imap_fnlist(AB(), lambda _, c1:
                    fnlist_sing(replace_char_at(word, i, c1))
                    if c != c1 else fnlist_nil()))))

#
####################################################

word = "hasan"
alphabet = "abcdefghijklmnopqrstuvwxyz"
newlist = fnlist_nil
for x in range(len(word)):
    foclet = word[x]
    for y in range(len(alphabet)):
        if foclet != alphabet[y]:
            newword = word
            newword = word.replace(newword[x], alphabet[y] )
            newlist = fnlist_cons(newword, newlist)

# Create some fnlists
xs = fnlist_sing(1)
ys = fnlist_sing(2)
zs = fnlist_sing(3)

# Concatenate them into a single fnlist
ls = fnlist_cons(fnlist_sing(xs), fnlist_sing(ys), fnlist_sing(zs), fnlist_nil)
concatenated = fnlist_concat(ls)

# Print the concatenated fnlist
fnlist_print(concatenated) # Output: [1; 2; 3]







