####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
The following implementation is stream-based:
# def graph_bfs(nxs, fnexts):
#     visited = set()
#     def helper(qnxs):
#         if qnxs.empty():
#             return strcon_nil()
#         else:
#             nx1 = qnxs.get()
#             # print("gtree_bfs: helper: nx1 = ", nx1)
#             for nx2 in fnexts(nx1):
#                 if not nx2 in visited:
#                     qnxs.put(nx2)
#                     visited.add(nx2)
#             return strcon_cons(nx1, lambda: helper(qnxs))
#         # end-of-(if(qnxs.empty())-then-else)
#     qnxs = queue.Queue()
#     for nx0 in nxs:
#         qnxs.put(nx0)
#         visited.add(nx1)
#     return lambda: helper(qnxs)
Please give a generator-based implementation of graph_bfs!!!
"""
def generator_graph_bfs(nxs, fnexts):
    # initialize a set to keep track of visited nodes
    visited = set()
    # initialize a list to use as a queue, and add the initial nodes to it
    qnxs = []
    for nx0 in nxs:
        qnxs.append(nx0)
        visited.add(nx0)
    # enter a loop that iterates while there are still nodes in the queue
    while qnxs:
        # get the first node from the queue and yield it
        nx1 = qnxs.pop(0)
        yield nx1
        # iterate over the neighbors of the current node
        for nx2 in fnexts(nx1):
            # if the neighbor has not been visited, add it to the queue and mark it as visited
            if nx2 not in visited:
                qnxs.append(nx2)
                visited.add(nx2)

####################################################
