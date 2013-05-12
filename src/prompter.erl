-module(prompter).
-export([guess/1, validate_guess/2, prompt/1]).
-define(GUESS_PROMPT_MESSAGE, "You have moves remaining.\nPlease enter your guess from the following options:\n(example: rgyb)\n\n").



guess(Avail_Sym) ->
  Guess = prompt(?GUESS_PROMPT_MESSAGE),
  Guess_List = convert_guess_to_list(Guess),
  validate_guess(Guess_List, Avail_Sym).



prompt(Message) ->
  console_io:gets(Message).



convert_guess_to_list(Guess) ->
  re:split(Guess, "", [{return, list}, trim]).



validate_guess(Guess_List, Avail_Sym) ->
  Guess_Invalid_Symbols = (lists:usort(Guess_List)) -- Avail_Sym,
  Guess_Length = length(Guess_List),
  validate_guess(Guess_List, Avail_Sym, Guess_Invalid_Symbols, Guess_Length).

validate_guess(Guess_List, _, [], 4) ->
  Guess_List;

validate_guess(_, Avail_Sym, _, _) ->
  console_io:display_invalid_selection(),
  guess(Avail_Sym).