-module(mastermind).
-export([start_game/0, run_game/2]).
-define(TOTAL_MOVES, 12).

start_game() ->
  Secret_Code = secret_code:get(),
  console_io:display_welcome_message(),
  % set_moves_remaining(),
  run_game(Secret_Code, []).

run_game(Secret_Code, Turns) ->
  % Game_Status
  % if game_over() =/= true ->
  % console_io:display_gameboard(Turns),
  Guess = console_io:get_guess(),
  Feedback = feedback:get(Secret_Code, Guess),

  io:format("The secret code is: ~p ~n", [Secret_Code]),
  io:format("The guess is: ~p ~n", [Guess]),
  io:format("The feedback is: ~p ~n", [Feedback]).

%   run_game(Secret_Code, Turns ++ [{Guess, Feedback}]);
% run_game(Secret_Code, Turns) ->
%   io:format("You win!").

%   display_gameboard
%   game_win? ? display_win_message : display_lose_message.

% game_over() ->
%   true.

% set_moves_remaining() ->
%   ?TOTAL_MOVES.
