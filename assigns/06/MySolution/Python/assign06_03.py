####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
import queue
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################
def nqueen(bd):
    """
    Takes a board configuration `bd` represented as a tuple of integers and returns the number of queens on the board.

    Args:
    - bd: A tuple of integers representing the board configuration.

    Returns:
    - The number of queens on the board.
    """
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res

def board_safety_all(bd):
    """
    Takes a board configuration `bd` represented as a tuple of integers and checks whether all the queens are safe.

    Args:
    - bd: A tuple of integers representing the board configuration.

    Returns:
    - 1 if all the queens are safe, 0 otherwise.
    """
    return int1_forall(nqueen(bd), lambda i0: board_safety_one(bd,i0))

def board_safety_one(bd,i0):
    """
    Takes a board configuration `bd` represented as a tuple of integers and an index `i0` of a queen on the board, and checks whether the queen at position `i0` is safe.

    Args:
    - bd: A tuple of integers representing the board configuration.
    - i0: The index of the queen on the board.

    Returns:
    - 1 if the queen is safe, 0 otherwise.
    """
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return  pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0,helper)
def fgetboards(bd,N):
    """
    Takes a board configuration `bd` represented as a tuple of integers and a board size `N`, and generates all the possible board configurations that can be obtained by placing one more queen on the board.

    Args:
    - bd: A tuple of integers representing the board configuration.
    - N: The size of the board.

    Returns:
    - A list of tuples representing all the possible board configurations that can be obtained by placing one more queen on the board.
    """
    if len(bd) > 0:
        boards = []
        for i in range(1, N+1):
            new_board = list(bd)
            new_board.append(i)
            if board_safety_one(tuple(new_board),len(new_board)-1):
                boards.append(tuple(new_board))
    else:
        boards = [(j,) for j in range(1, N+1)]
    return pylist_fnlistize(boards)

def gtree_dfs(nxs, fchlds, N):
    """
    Returns a generator function for performing depth-first search on a tree.
    
    Parameters:
    nxs (Queue): A queue of nodes in the tree
    fchlds (function): A function that generates child nodes of a given node
    N (int): The size of the board
    
    Returns:
    function: A generator function for performing depth-first search on the tree
    """
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            for nx2 in fchlds(nx1,N):
                nxs.put(nx2)
            return strcon_cons(nx1, gtree_dfs(nxs, fchlds, N)) 
    return lambda: helper(nxs)


def solve_N_queen_puzzle(N):
    """
    Solves the N-Queens puzzle using depth-first search.
    
    Parameters:
    N (int): The size of the board
    
    Returns:
    stream: A stream of solutions to the N-Queens puzzle
    """
    man = queue.LifoQueue()
    new = fgetboards((), N)
    for i in range(N):
        ls = new
        new = new.cons1
        man.put(new)
        new = ls.cons2
    test = stream_make_filter(gtree_dfs(man, fgetboards, N), lambda w: len(w) ==N)
    return test



