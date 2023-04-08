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
def test_goal_helper(word, goal, res):
    if list(word)[-1] == goal:
        res.append(word)
        return False
    else:
        return True
    
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

def doublet_bfs_test(word, goal):
	if word_is_legal(word) and \
	word_is_legal(goal) and \
	len(word) == len(goal):
		res = []
		stream_fxs = doublet_stream_from(word)
		stream_forall(stream_fxs, \
			lambda x: test_goal_helper(x, goal, res))
		return res[-1]
                    
	else:
		return None
####################################################
