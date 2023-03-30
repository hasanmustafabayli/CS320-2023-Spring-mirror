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

def gtree_dfs(nxs, work, N):
    lambda: strcon_nil() if nxs.ctag == 0 else\
    strcon_cons(nxs.cons1, gtree_dfs(fnlist_append(fgetboards(nxs.cons1, N)), nxs, work, N))
                   
def nqueen(bd):
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res

def board_safety_all(bd):
    return int1_forall(nqueen(bd), lambda i0: board_safety_one(bd,i0))

def board_safety_one(bd,i0):
    def helper(j0):
        pi = bd(i0)
        pj = bd(j0)
        return  pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0,helper)

def fgetboards(bd,N):
    if len(bd) > 0:
        boards = []
        for i in range(1, N-1):
            new_board = list(bd)
            new_board.append(i)
            if board_safety_all(tuple(new_board),N):
                boards.append(tuple(new_board))
            else:
                boards = [(j,) for j in range(1, N+1)]
            return pylist_fnlistize(boards)

def solve_N_queen_puzzle(N):
    x = fgetboards((), N)
    y = gtree_dfs(x, fgetboards,N)
    return y