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


