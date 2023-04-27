########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################

########################################################################
def wordle_guess(hints):
    """
    Given a history of wordle hints, this function returns a
    word as the player's guess.
    """
    # Initialize the word variable with the correct letters
    word = [hint[0][1] for hint in hints]
    # Initialize a set of all available letters
    avail = set('abcdefghijklmnopqrstuvwxyz')

    # Iterate through each hint in the history
    for hint in hints:
        # Iterate through each (position, letter) pair in the hint
        for index, (pos, char_guess) in enumerate(hint):
            # If the letter is not in the correct position, remove it from the available letters
            if pos == 2:
                avail.discard(char_guess)

    # Iterate through each index in the word
    for index, char in enumerate(word):
        # If the current index has not been filled in, try to fill it in with a letter from the available letters
        if char == '_':
            word[index] = avail.pop()

    # Return the word as a string
    return ''.join(word)

def wordle_guess(hints):
    """
    Given a history of wordle hints, this function returns a
    word as the player's guess.
    """
    # Initialize a list of underscores to represent the unknown word
    word = ['_'] * len(hints[0])
    # Initialize a set of all available letters
    avail = set('abcdefghijklmnopqrstuvwxyz')
    # Initialize a list of sets, where each set contains letters that are not in the
    # correct position for the corresponding index in the word
    not_in_pos = [set(avail) for _ in range(len(hints[0]))]

    # Iterate through each hint in the history
    for hint in hints:
        # Iterate through each (position, letter) pair in the hint
        for index, (pos, char_guess) in enumerate(hint):
            # If the letter is in the correct position, update the word and remove the letter
            # from the corresponding set in not_in_pos
            if pos == 1:
                word[index] = char_guess
                for i in range(len(hints[0])):
                    if i != index:
                        not_in_pos[i].discard(char_guess)
            # If the letter is not in the correct position, remove it from the corresponding
            # set in not_in_pos
            elif pos == 2:
                not_in_pos[index].discard(char_guess)
            # If the letter is not in the word, remove it from the available letters
            else:
                avail.discard(char_guess)

    # Iterate through each index in the word
    for index, char in enumerate(word):
        # If the current index has not been filled in, try to fill it in with a letter
        # that is not in the correct position
        if char == '_':
            if not_in_pos[index]:
                word[index] = not_in_pos[index].pop()
            # If there are no letters that are not in the correct position, fill in the index
            # with any available letter
            else:
                word[index] = avail.pop()

    # Return the word as a string
    return ''.join(word)

myhints = [[(2, 'l'), (2, 'a'), (2, 't'), (2, 'e'), (2, 'r')]]
print(wordle_guess(myhints))