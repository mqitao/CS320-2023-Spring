################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *

import nltk
nltk.download('words')
from nltk.corpus import words
################################################
setofwords = set(words.words())
################################################
def word_is_legal(word):
    return word in setofwords
################################################
#

def string_length(word:str):
    return len(word)

def strsub(word:str, posn:int):
    return word[posn]


def list_concat(xs):
	r0 = []
	for item in xs:
		
		r0 = r0 + item  
		     	
	return r0
	
def AB():
	return "abcdefghijklmnopqrstuvwxyz"

def string_tabulate(len:int, lamb):
	st = ""
	for j in range(len):
		temp = lamb(j)
		st = st + temp
	return st   

def list_nil():
    return []

def string_imap_list(word: str, lamb):
	fin_list = []

	for i in range(len(word)):
		curr_char = strsub(word, i)
		
		res = lamb(i, curr_char) 
		fin_list.append(res)

	return fin_list	

def list_sing(lamb):
	return [lamb]
       

def word_neighbors(word):
    wlen = string_length(word)
    return pylist_fnlistize(list_concat(string_imap_list(word, lambda i, c: 
	list_concat(string_imap_list(AB(), lambda _, c1: 
	list_sing(string_tabulate(wlen, lambda j: strsub(word, j) if i != j else c1)) if (c != c1) 
	else list_nil())))))
#
####################################################
