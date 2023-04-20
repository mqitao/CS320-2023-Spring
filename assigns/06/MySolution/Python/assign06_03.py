####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../06')
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
    """return the number of queens
    currently on the board"""    
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res

def board_safety_all(bd):
    """
    determine if every queen on the board
    is safe 
    """
    return \
        int1_forall\
        (nqueen(bd), \
         lambda i0: board_safety_one(bd, i0))

def board_safety_one(bd, i0):
    """
    combinator for the prior function, accepts a board
    and an i0 value, checks whether every queen before
    the queen at i0 is safe in relation to i0   
    """
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0, helper)

def int1_map_list(xs, fopr):
	return foreach_to_map_pylist(int1_foreach)(xs, fopr)

def board_fset_at(bd:list, i:int, p:int):
	temp_bd = bd.copy()
	temp_bd[i] = p 
	return temp_bd

def board_extend(bd, i, N):
	return pylist_filter_pylist(int1_map_list( \
	N, lambda p: board_fset_at(bd, i, p+1)), lambda bd: board_safety_one(bd, i) )

def solve_N_queen_puzzle(N):
    
	stack = queue.LifoQueue()
	stack.put([0]*N)      
	def dfs_helper(stk_queue, visited):
		while stk_queue.empty() == False:
			u = stk_queue.get()
			
			p = N - len([i for i in u if i == 0])
			if p < N:		
				child = board_extend(u, p, N)
				for v in reversed(child):
					if tuple(v) not in visited:
						stk_queue.put(v)
						visited.add(tuple(v))
    		
			if u[-1] != 0:
				return \
				strcon_cons(tuple(u), lambda : dfs_helper(stk_queue, visited))
		return strcon_nil() 
    
	return lambda:dfs_helper(stack, set())
    

   
####################################################
