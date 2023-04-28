########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################

########################################################################
import nltk
nltk.download('words')
from nltk.corpus import words

# Store the set of valid English words
valid_words_set = set(words.words())

def depth_first_search(start_nodes, get_neighbors_func):
    visited_set = set()
    node_stack = []
    node_results = []

    # Add start nodes to stack and visited set
    for start_node in start_nodes:
        node_stack.append(start_node)
        visited_set.add(start_node)

    # Traverse graph using DFS
    while node_stack:
        current_node = node_stack.pop()
        node_results.append(current_node)

        for neighbor_node in reversed(get_neighbors_func(current_node)):
            if neighbor_node not in visited_set:
                node_stack.append(neighbor_node)
                visited_set.add(neighbor_node)

    return node_results


def get_neighbors(node, included_letters):
    """
    Returns a list of neighbors for the given node by replacing the
    "$" character with each letter in the included_letters set.
    """
    neighbor_list = []
    try:
        index = node.index("$")
        for letter in included_letters:
            neighbor_list.append(node[:index] + letter + node[index+1:])
        return neighbor_list
    except ValueError:
        return []


def wordle_guess(hint_list):
    """
    Given a list of hints, returns the best guess for the target word.
    A hint is a tuple of the form (letter_status, letter), where letter_status
    is an integer representing the status of the letter in the target word:
        0: letter not in target word
        1: letter correctly placed in target word
        2: letter in target word, but not in correct position
    """
    # Initialize variables
    guessed_word = "$" * len(hint_list[0])
    letter_bank = set("abcdefghijklmnopqrstuvwxyz")
    incorrect_guesses_set = set()
    included_letters_list = []

    # Parse hints and update guessed_word and sets
    for hint in hint_list:
        for i, (letter_status, letter) in enumerate(hint):
            if letter_status == 1:
                guessed_word = guessed_word[:i] + letter + guessed_word[i+1:]
            elif letter_status == 2:
                incorrect_guesses_set.add((i, letter))
                included_letters_list += letter
            elif letter_status == 0:
                letter_bank.discard(letter)

    # Define a helper function to check if a word is valid
    def is_word_valid(word, incorrect_set, included_list):
        """
        Returns True if the given word is a valid guess, False otherwise.
        A word is considered valid if it contains all the letters in the included_list,
        does not contain any of the letters in the incorrect_set, does not contain the
        "$" character, and is a valid English word.
        """
        if "$" in word:
            return False
        if any(letter in incorrect_set for letter in word):
            return False
        if not all(letter in word for letter in included_list):
            return False
        return word in valid_words_set

    # Check if guessed_word is complete
    if "$" not in guessed_word:
        return guessed_word

    # Generate all possible valid guesses using DFS
    valid_guesses_list = depth_first_search([guessed_word], lambda x: get_neighbors(x, included_letters_list))

    # Find the first valid guess and return it
    for word in valid_guesses_list:
        if is_word_valid(word, incorrect_guesses_set, included_letters_list):
            return word

    # If no valid guess is found, return the current guessed_word
    return guessed_word



