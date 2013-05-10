-module(mastermind).
-export([start_game/0, run_game/2]).
-define(TOTAL_MOVES, 12).

start_game() ->
  Secret_Code = secret_code:get(),
  console_io:display_welcome_message(),
  set_moves_remaining(),
  run_game([], Secret_Code).

run_game(Guess, Secret_Code) when Guess =/= Secret_Code ->
  console_io:display_gameboard(),
  New_Guess = console_io:get_move(),
  Feedback = feedback:get(New_Guess, Secret_Code),
  io:format("The secret code is: ~p ~n", [Secret_Code]),
  io:format("The guess is: ~p ~n", [New_Guess]),
  io:format("The feedback is: ~p ~n", [Feedback]),
  run_game(Guess, Secret_Code);
  % store_turn()
  % decrement_moves_remaining()
run_game(Guess, Secret_Code) when Guess == Secret_Code ->
  io:format("You win!").

% end_game
%   display_gameboard
%   game_win? ? display_win_message : display_lose_message.

set_moves_remaining() ->
  ?TOTAL_MOVES.