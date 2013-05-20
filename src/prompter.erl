-module(prompter).
-export([guess/3, validate_guess/4, play_again/1, validate_play_again/2]).
-define(GUESS_PROMPT_MESSAGE, "You have ~p moves remaining.~nPlease enter your guess from the following options: ~n~p~n(example: abcd)~n~n").
-define(PLAY_AGAIN_PROMPT_MESSAGE, "\nWould you like to play again? (y/n)\n").
-define(PLAY_AGAIN_RESPONSES, ["y", "n"]).



guess(IOModule, Rem_Moves, Avail_Sym) ->
  apply(IOModule, display, [?GUESS_PROMPT_MESSAGE, [Rem_Moves, Avail_Sym]]),
  Guess = apply(IOModule, get_guess, []),
  Guess_List = convert_guess_to_list(Guess),
  validate_guess(IOModule, Guess_List, Rem_Moves, Avail_Sym).



convert_guess_to_list(Guess) ->
  re:split(Guess, "", [{return, list}, trim]).



validate_guess(IOModule, Guess_List, Rem_Moves, Avail_Sym) ->
  Guess_Invalid_Symbols = (lists:usort(Guess_List)) -- Avail_Sym,
  Guess_Length = length(Guess_List),
  validate_guess(IOModule, Guess_List, Avail_Sym, Rem_Moves, Guess_Invalid_Symbols, Guess_Length).




validate_guess(_, Guess_List, _, _, [], 4) ->
  Guess_List;

validate_guess(IOModule, _, Avail_Sym, Rem_Moves, _, _) ->
  apply(IOModule, display_invalid_selection, []),
  guess(IOModule, Rem_Moves, Avail_Sym).




play_again(IOModule) ->
  apply(IOModule, display, [?PLAY_AGAIN_PROMPT_MESSAGE, []]),
  Play_Again = apply(IOModule, get_play_again, []),
  validate_play_again(IOModule, Play_Again).



validate_play_again(IOModule, Play_Again) ->
  Play_Again_Invalid_Response = ([Play_Again] -- ?PLAY_AGAIN_RESPONSES),
  Play_Again_Response_Length = length(Play_Again),
  validate_play_again(IOModule, Play_Again, Play_Again_Invalid_Response, Play_Again_Response_Length).

validate_play_again(_, Play_Again, [], 1) ->
  Play_Again;

validate_play_again(IOModule, _, _, _) ->
  apply(IOModule, display_invalid_selection, []),
  play_again(IOModule).