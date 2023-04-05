import sys
from os.path import dirname, abspath
d = dirname(dirname(abspath(__file__)))

sys.path.append(d + "\\06\\MySolution\\Python")
sys.path.append('../../mypylib')
from mypylib_cls import *
from assign06_04 import *


def test_goal_helper(word, goal, res):
    if list(word)[-1] == goal:
        res.append(word)
        return False
    else:
        return True

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
            
                
                    
     
