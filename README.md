This game was written in Erlang.  To compile game and run tests, navigate to game directory and type:

make

To play the game, navigate to game directory and type:

make play_game

For more commands, see the makefile file in the root directory.

How to play:

This version of Mastermind is configured to generate a random 4-character secret code.  The code is generated from 6 characters ("abcdefg").

Your job is to guess the secret code.

You have 12 attempts to guess the secret code.

Enter a guess by inputting 4 characters from the available list of characters.  For example, "aaaa" would be considered a valid guess and "1234" would be considered an invalid guess.

Once your guess is input, the game will evaluate your guess and provide feedback.  A black peg ("b") indicates you have one correctly-chosen character in the correct position in your guess.  A white character indicates you have one correctly-chosen character but is in the incorrect position.  Nothing is returned when a character is not in the secret code.

For example, suppose the secret code is "rryy" and you entered "bbbb", the game would generate no feedback since none of the letters you chose were in the secret code.  If you then entered a guess of "yyrr", the game would generate feedback of "wwww" since all of the characters you chose were correct but in the incorrect positions.  If you entered "ryry", the feedback generated would be "bbww" indicating that two of the characters in your guess were in the correct positions and two were in the incorrect positions.

It should be noted that the feedback generated is not indicative as to which characters are in the correct positions.  The feedback is always listed in alphabetical order (b's first and then w's).


Happy playing!