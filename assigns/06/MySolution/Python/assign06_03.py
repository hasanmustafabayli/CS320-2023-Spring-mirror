####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################
def solve_N_queen_puzzle(N):
    """
Please revisit assign04-04.sml.
A board of size N is a tuple of length N.
######
For instance, a tuple (0, 0, 0, 0) stands
for a board of size 4 (that is, a 4x4 board)
where there are no queen pieces on the board.
######
For instance, a tuple (2, 1, 0, 0) stands
for a board of size 4 (that is, a 4x4 board)
where there are two queen pieces; the queen piece
on the 1st row is on the 2nd column; the queen piece
on the 2nd row is on the 1st column; the last two rows
contain no queen pieces.
######
This function [solve_N_queen_puzzle] should return
a stream of ALL the boards of size N that contain N
queen pieces (one on each row and on each column) such
that no queen piece on the board can catch any other ones
on the same board.
"""
####################################################

from typing import List, Tuple
from itertools import permutations
from typing import List, Any, Callable

def gtree_dfs(root: Any, generate_children: Callable[[Any], List[Any]], max_depth: int) -> List[Any]:
    """
    Perform depth-first search on a tree represented as a generator of children.
    
    Args:
    - root: the root node of the tree
    - generate_children: a function that takes a node and generates its children
    - max_depth: the maximum depth to explore
    
    Returns:
    - A list of nodes in the tree
    """
    result = []
    stack = [(root, 0)]
    
    while stack:
        node, depth = stack.pop()
        if depth > max_depth:
            continue
        result.append(node)
        children = generate_children(node)
        for child in reversed(children):
            stack.append((child, depth+1))
            
    return result


def is_valid_board(board: Tuple[int]) -> bool:
    n = len(board)
    for i in range(n):
        for j in range(i+1, n):
            if board[i] == board[j] or abs(board[i]-board[j]) == j-i:
                return False
    return True

def solve_N_queen_puzzle(N: int) -> List[Tuple[int]]:
    empty_board = (0,) * N
    
    def generate_children(board: Tuple[int]) -> List[Tuple[int]]:
        row = board.index(0)
        for col in range(1, N+1):
            child = board[:row] + (col,) + board[row+1:]
            if is_valid_board(child):
                yield child
    
    return list(gtree_dfs(empty_board, generate_children, N))


    raise NotImplementedError
####################################################
