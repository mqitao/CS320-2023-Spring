####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../06')
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
from dictwords import *
import queue
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
####################################################
def fn_child(word): 
	pylists = fnlist_pylistize(word_neighbors(word))	
	return pylist_filter_pylist(pylists, lambda i: word_is_legal(i))



def doublet_stream_from(word):

	visited = {word}
	q = queue.Queue()
	q.put([word])

	def bfs_helper(que, visited, curr_u, u_child):
		if que.empty():
			return strcon_nil()
		
		elif u_child != []:
			rtn_list = curr_u.copy()
			rtn_list.append(u_child.pop())
			
			return strcon_cons(tuple(rtn_list), \
				lambda : bfs_helper(que, visited, curr_u, u_child))	
			
		else:
			u = q.get()
		
			child = fn_child(u[-1])
			for c in child:
				if c not in visited:
					visited.add(c)
					que.put( u + [c] )
				u_child.append(c)

			curr_u = u 	
			r_child = [i for i in reversed(u_child)]
			
			rtn_list = curr_u.copy()
			if len(curr_u) > 1: 
				rtn_list.append(r_child.pop())             
         
			return strcon_cons(tuple(rtn_list), \
	                      lambda : bfs_helper(que, visited, \
				curr_u, r_child))		 

	return lambda : bfs_helper(q, visited, [], [])


"""
def doublet_stream_from(word):

	parent = {word: None}
	visited = {word}

	q = queue.Queue()
	q.put(word)

	def bfs_helper(que, visited, last_tuple):
		if que.empty():
			return strcon_nil()
		else:
			u = q.get()
		
			child = fn_child(u)
			for c in child:
				if c not in visited:
					visited.add(c)
					parent[c] = u
					que.put(c)

			# trace back the tree to find the path from
			# current u to source node s 
			rtn_tuple = []
			v = u	
			while parent[v] != None:
				rtn_tuple.append(v)
				v = parent[v]
			
			rtn_tuple.append(v)
			rev_tuple = [i for i in reversed(rtn_tuple)]		
			return strcon_cons(tuple(rev_tuple), \
                      lambda : bfs_helper(que, visited, parent))		 

	return lambda : bfs_helper(q, visited, parent)"""
####################################################
