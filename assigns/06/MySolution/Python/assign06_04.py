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
def get_word_neighbors(word):
    """This function takes a string word as input and returns a functional list (fnlist) of all the strings 
    that can be created by changing a single character in word to another character in the alphabet. 
    For example, if word is "cat", the function will return an fnlist of the following strings: 
    ["aat", "bat", "cat", "dat", ..., "caz"]. The function uses two nested string_imap_fnlist() 
    calls to generate all the possible neighbors."""
    def get_alphabets():
        return "abcdefghijklmnopqrstuvwxyz"
    
    def replace_char_at(s, index, c):
        return s[:index] + c + s[index+1:]

    word_len = len(word)
    
    return fnlist_concat(
        string_imap_fnlist(word, lambda i, c:
            fnlist_concat(
                string_imap_fnlist(get_alphabets(), lambda _, c1:
                    fnlist_sing(replace_char_at(word, i, c1))
                    if c != c1 else fnlist_nil()))))

def get_word_neighbors_legal(word):
    """This function takes a string word as input and returns an fnlist of all the legal words that can 
    be created by changing a single character in word to another character in the alphabet. 
    The function uses the get_word_neighbors() function to generate all the possible neighbors of word, 
    and then filters out any neighbors that are not legal words using the word_is_legal() function."""
    return fnlist_filter_pylist(get_word_neighbors(word), word_is_legal)

def get_wpath_neighbors_legal(wpath):
    """This function takes a tuple wpath as input, which represents a sequence of words, and returns a list of all the possible extensions of wpath that 
    end in a legal word. The function gets the last word in wpath, generates all the possible legal neighbors 
    of that word using the get_word_neighbors_legal() function, and then appends each neighbor to wpath to create a new path."""
    word1 = wpath[-1]
    words = get_word_neighbors_legal(word1)
    return [wpath + (word2,) for word2 in words]

def get_gtree_bfs(nxs, fchildren):
    """This function takes a queue nxs and a function fchildren as inputs, and returns a lambda function that 
    performs a breadth-first search (BFS) of a tree. The function repeatedly pops an element 
    from the queue, applies fchildren() to generate its children, and adds them to the end of the queue. 
    The function returns an fnlist of all the elements in the tree in BFS order."""
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            for nx2 in fchildren(nx1):
                nxs.put(nx2)
            return strcon_cons(nx1, get_gtree_bfs(nxs,fchildren))
    return lambda: helper(nxs)


def doublet_stream_from(word):
    """"This function takes a string word as input and returns a lambda function that 
    generates a stream of all the possible doublets (pairs of words) that can be formed 
    by changing a single letter at a time from word to another legal word. 
    The function uses the gtree_bfs() function to perform a BFS of a tree whose nodes are sequences of words, 
    starting with the initial sequence [word], and whose edges are formed by adding a legal neighbor to the end of a sequence.
      The lambda function returned by doublet_stream_from() generates the doublets by iterating over the BFS fnlist and 
      returning pairs of consecutive elements."""  
    print("hasan")
    nxs = queue.Queue(); nxs.put((word,))
    return get_gtree_bfs(nxs, get_wpath_neighbors_legal)

stream_iforall(doublet_stream_from("water"), lambda i,x: i <100 and not(print(x)))
    






