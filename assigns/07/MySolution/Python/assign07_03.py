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

def doublet_bfs_test(start_word, end_word):
    """
    Given two words start_word and end_word, this function should
    return None if start_word and end_word do not form a doublet. Otherwise,
    it returns a path connecting start_word and end_word that attests to the
    two words forming a doublet.
    """
    # Get the list of valid words
    word_list = words.words()

    # Create a set to store valid words for faster lookup
    valid_words = set(word_list)

    # Check if the start_word and end_word are valid words
    if start_word not in valid_words or end_word not in valid_words:
        return []

    # Create a queue to store words to be explored
    queue = deque()
    # Enqueue the start_word as the starting point for BFS
    queue.append((start_word, [start_word]))

    # Keep track of visited words to avoid cycles
    visited = set([start_word])

    # Continue BFS until the queue is empty
    while queue:
        # Dequeue the next word and its path
        curr_word, curr_path = queue.popleft()

        # Check if curr_word is a doublet with end_word
        if curr_word == end_word:
            return curr_path

        # Generate all 1-step doublets of the curr_word
        for i in range(len(curr_word)):
            for c in "abcdefghijklmnopqrstuvwxyz":
                if c != curr_word[i]:
                    new_word = curr_word[:i] + c + curr_word[i+1:]
                    # If new_word is a valid word and has not been visited, enqueue it
                    if new_word in valid_words and new_word not in visited:
                        visited.add(new_word)
                        queue.append((new_word, curr_path + [new_word]))

    # If end_word cannot be reached from start_word, return an empty list
    return []

