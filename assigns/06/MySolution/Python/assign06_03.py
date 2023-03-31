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
        pi = bd[i0]
        pj = bd[j0]
        return  pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0,helper)
def fgetboards(bd,N):
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
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fchlds(nx1,N):
                nxs.put(nx2)
            return strcon_cons(nx1, gtree_dfs(nxs, fchlds, N)) 
    return lambda: helper(nxs)


def solve_N_queen_puzzle(N):
    x = queue.LifoQueue()
    b = fgetboards((), N)
    for i in range(N):
        y = b
        b = b.cons1
        x.put(b)
        b = y.cons2
    test = stream_make_filter(gtree_dfs(x, fgetboards, N), lambda w: len(w) ==N)
    return test



