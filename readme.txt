abrambleninja - Affine Solver

An affine is a combination of multiplicative and additive basic ciphers. An additive cipher, also known as a Caesar cipher, is a simple letter shift. For example, if we write out the alphabet numbers (a=1, b=2, etc), we can add any integer n in [1,25] modulo 26 to get a new set of alphabet numbers, each of which correspond to the letter at the same position in the list. A multiplicative cipher involves multiplying the list of alphabet numbers by a number less than and relatively prime to 26 (i.e. 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25) modulo 26 to get a new set. For example, we might have a multiplication integer of 5 and an addition one of 24, so to convert a letter to the new cipher, we would take its alphabet number, multiply by 5, add 24, and find the remainder of this when divided by 26. Let's look at an example:
J has an alphabet letter of 10
10*5 + 24 ≡ 22
22 corresponds to V
Thus, to encrypt the letter J using this cipher, we would replace it with the letter V. 

This program solves affines by generating all possible affines of a certain input and sorting them by the number of English words; assuming Bob is not sending gibberish, this is a reasonable assumption to be the best affine as not many possible combinations will have words.
