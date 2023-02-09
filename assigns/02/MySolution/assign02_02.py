####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################
from assign02_01 import mylist_append
def qpart(xs, p0):
	if xs.ctag == 0:
		return (mylist_nil(), mylist_nil())
	elif xs.cons1 <= p0:
		(ys, zs) = qpart(xs.cons2, p0)
		return (mylist_cons(xs.cons1, ys), zs)
	else: 
		(ys, zs) = qpart(xs.cons2, p0)
		return (ys, mylist_cons(xs.cons1, zs))


def mylist_quicksort(xs):
	if xs.ctag == 0:
		return mylist_nil()
	else:
		(ys, zs) = qpart(xs.cons2, xs.cons1)
		ys = mylist_quicksort(ys)
		zs = mylist_quicksort(zs)
		return mylist_append(ys, mylist_cons(xs.cons1, zs))
    
	