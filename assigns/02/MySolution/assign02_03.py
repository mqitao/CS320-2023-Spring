####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################
def split(xs):
	if xs.ctag == 0:
		return (mylist_nil(), mylist_nil())
	else:
		if xs.cons2.ctag == 0:
			return (mylist_cons(xs.cons1,mylist_nil()), mylist_nil())
		else:
			(ys, zs) = split(xs.cons2.cons2)
			return(mylist_cons(xs.cons1, ys), mylist_cons(xs.cons2.cons1, zs))

def merge(ys, zs):
	if ys.ctag == 0:
		return zs
	else:
		if zs.ctag == 0:
			return ys
		else:
			if ys.cons1 <= zs.cons1:
				return mylist_cons(ys.cons1, merge(ys.cons2, zs))
			else:
				return mylist_cons(zs.cons1, merge(zs.cons2, ys))

def mylist_mergesort(xs):
	if xs.ctag == 0:
		return mylist_nil()
	else:
		if xs.cons2.ctag == 0:
			return mylist_cons(xs.cons1, mylist_nil())
		else:
			(ys, zs) = split(xs.cons2.cons2)
			return merge(mylist_mergesort(mylist_cons(xs.cons1, ys)), mylist_mergesort(mylist_cons(xs.cons2.cons1, zs)))