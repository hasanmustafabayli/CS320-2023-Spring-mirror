########################
# HX-2023-04-15: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1
1: c appears in w1 at the same position as it does in w2
2: c appears in w1 at a different position as it does in w2
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""
########################################################################

########################################################################
# Define a function named "wordle_hint" which takes two string arguments "w1" and "w2"
def wordle_hint(w1, w2):
    # Initialize a list "w1_counts" with 26 zeros to represent the count of each letter in "w1"
    w1_counts = [0] * 26
    # Loop through each letter in "w1" and increment the corresponding count in "w1_counts"
    for c in w1:
        w1_counts[ord(c) - ord('a')] += 1
    # Loop through each letter in "w2" along with its index
    for i, c in enumerate(w2):
        # Check if the current letter in "w2" is in "w1"
        if c in w1:
            # Compute the index of the current letter in "w1_counts"
            idx = ord(c) - ord('a')
            # If the current letter in "w2" is the same as the corresponding letter in "w1"
            if c == w1[i]:
                # Yield a tuple with value 1 and the current letter in "w2"
                yield (1, c)
                # Decrement the count of the current letter in "w1_counts"
                w1_counts[idx] -= 1
            # If the count of the current letter in "w1_counts" is greater than 0
            elif w1_counts[idx] > 0:
                # Yield a tuple with value 2 and the current letter in "w2"
                yield (2, c)
                # Decrement the count of the current letter in "w1_counts"
                w1_counts[idx] -= 1
            # If the count of the current letter in "w1_counts" is 0
            else:
                # Yield a tuple with value 0 and the current letter in "w2"
                yield (0, c)
        # If the current letter in "w2" is not in "w1"
        else:
            # Yield a tuple with value 0 and the current letter in "w2"
            yield (0, c)





