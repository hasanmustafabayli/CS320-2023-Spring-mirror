####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.path.append('../../../07')
sys.path.append('./../../../../mypylib')
####################################################
from dictwords import *
from mypylib_cls import *
from assign05_02 import *
####################################################
"""
HX-2023-03-24: 10 points
Solving the doublet puzzle
"""
####################################################
"""
Please revisit assign06_04.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
<Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
"""
####################################################
"""def doublet_bfs_test(w1, w2):
    Given two words w1 and w2, this function should
    return None if w1 and w2 do not for a doublet. Otherwise
    it returns a path connecting w1 and w2 that attests to the
    two words forming a doublet.
    raise NotImplementedError"""
####################################################

from collections import deque

from nltk.corpus import words
from collections import deque

def doublet_bfs_test(w1, w2):
    """
    Given two words w1 and w2, this function should
    return None if w1 and w2 do not for a doublet. Otherwise
    it returns a path connecting w1 and w2 that attests to the
    two words forming a doublet.
    """
    # Get the list of valid words
    word_list = words.words()

    # Create a set to store valid words for faster lookup
    valid_words = set(word_list)

    # Create a queue to store words to be explored
    queue = deque()
    # Enqueue w1 as the starting word
    queue.append((w1, [w1]))

    # Keep track of visited words to avoid cycles
    visited = set([w1])

    # Continue BFS until the queue is empty
    while queue:
        # Dequeue the next word and its path
        word, path = queue.popleft()

        # Check if word is a doublet with w2
        if word == w2:
            return path

        # Generate all 1-step doublets of the word
        for i in range(len(word)):
            for c in "abcdefghijklmnopqrstuvwxyz":
                if c != word[i]:
                    new_word = word[:i] + c + word[i+1:]
                    # If new_word is a valid word and has not been visited, enqueue it
                    if new_word in valid_words and new_word not in visited:
                        visited.add(new_word)
                        queue.append((new_word, path + [new_word]))

    # If w2 cannot be reached from w1, return None
    return None


