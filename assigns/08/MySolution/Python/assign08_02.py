####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""

####################################################
def generator_merge2(gen1, gen2, ite3):
    def peek(generate):
        try:
            test_case = next(generate)
        except StopIteration:
            return None
        return test_case 
    
    def gen_comb(xs1, xs2, y):
        if y > 0:
            yield xs1
            y = 0
        yield from xs2
        
    while True:
        res1 = peek(gen1)
        
        if res1 is None:
            yield peek(gen2)
        else:
            res2 = peek(gen2)
            if res2 is None:
                yield res1
            else:
                if ite3(res1, res2):
                    gen2 = gen_comb(res2, gen2, 2)
                    yield res1
                else:
                    gen1 = gen_comb(res1, gen1, 2)
                    yield res2
