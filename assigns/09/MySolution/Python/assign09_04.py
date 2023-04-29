########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################
def wordle_guess(hints):
    n = len(hints[0])
    
    ret = ['?']*n
    is_found = {n:False for n in range(n)}
    rem_set = {n: set() for n in range(n)}
    
    for lis in hints:
        for i in range(n):
            
            if is_found[i] and lis[i][0] == 2:
               rem_set[i].add(lis[i][1])
               
            elif not is_found[i]:
                
                if lis[i][0] == 1:
                    is_found[i] = True
                    ret[i] = lis[i][1]
                
                elif lis[i][0] == 2:
                    rem_set[i].add(lis[i][1])

    for i in range(n):
        if ret[i] == '?':
            for key in rem_set:
                if rem_set[key] != set() and key != i:
                    guess = rem_set[key].pop()
                    ret[i] = guess
                    break                                          
     
    return  "".join(ret) #[ret, is_found, rem_set]
########################################################################
def find_pos(xs):
	ret = {}
	for li in xs:
		for i in range(len(li)):
			if li[i][0] == 0 or li[i][0] == 2:
				if li[i][1] in ret:
					ret[li[i][1]].append(i)  				 
				else:
					ret[li[i][1]] = [i] 
	return ret	

def find_cons2(xs):
    ret2 = set()
        
    for li in xs:
        for i in range(len(li)):
            if li[i][0] == 2:
                ret2.add(li[i][1])
    
    ret1 = {key: set() for key in ret2}               
    for li in xs:
        for i in range(len(li)):
            if li[i][0] == 1 and li[i][1] in ret1:
                ret1[li[i][1]].add(i)
    
    return [ret2, ret1]


def check_needs(xs):
    ret = set()
    for li in xs:
        for item in li:
            if item[0] == 1:
                ret.add(item[1])
    return ret            
