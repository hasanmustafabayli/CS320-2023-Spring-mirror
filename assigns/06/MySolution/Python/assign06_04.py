####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
import queue
sys.path.append('./../..')
from  dictwords import *
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
"""
Please revisit assign05_02.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
Given a word, the function [doublet_stream_from] returns a stream
enumerating *all* the tuples such that the first element of the tuple
is the given word and every two consecutive words in the tuple form a
1-step doublet. The enumeration of tuples should be done so that shorter
tuples are always enumerated ahead of longer ones.
######
"""
####################################################
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

def word_neighbors_legal(word):
    return fnlist_filter_pylist(word_neighbors(word), word_is_legal)

def wpath_neighbors_legal(wpath):
    word1 = wpath[-1]
    words = word_neighbors_legal(word1)
    return [wpath + (word2,) for word2 in words]

def gtree_bfs(nxs, fchildren):
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            for nx2 in fchildren(nx1):
                nxs.put(nx2)
            return strcon_cons(nx1, gtree_bfs(nxs,fchildren))
    return lambda: helper(nxs)

def doublet_stream_from(word):
    nxs = queue.Queue(); nxs.put((word,))
    return gtree_bfs(nxs, wpath_neighbors_legal)

stream_iforall(doublet_stream_from("water"), lambda i,x: i <100 and not(print(x)))
    






