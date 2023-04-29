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
     
    return "".join(ret)
########################################################################
