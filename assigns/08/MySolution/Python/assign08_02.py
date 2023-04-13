####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-04-07: 20 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    # get the next value from each generator
    val1 = next(gen1, None)
    val2 = next(gen2, None)
    
    # iterate until one or both generators are exhausted
    while True:
        # if val1 is not None and either val2 is None or val1 <= val2:
        if val1 is not None and (val2 is None or lte3(val1, val2)):
            # yield val1 and get the next value from gen1
            yield val1
            val1 = next(gen1, None)
        # otherwise, if val2 is not None, yield val2 and get the next value from gen2
        elif val2 is not None:
            yield val2
            val2 = next(gen2, None)
        # if both val1 and val2 are None, break the loop and return None
        else:
            break
    return None
####################################################
