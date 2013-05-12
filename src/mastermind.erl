-module(mastermind).
-export([start/0, run/3, game_decision/1, game_decision/2]).
-define(TOTAL_MOVES, 4).

-include("secret_code.hrl").



start() ->
  Secret_Code = secret_code:get(),
  console_io:display_welcome_message(),
  run(Secret_Code, [], play).



run(Secret_Code, Turns, play) ->
  console_io:display_gameboard(Turns),
  Guess = prompter:guess(?SYMBOLS),
  Feedback = feedback:get(Secret_Code, Guess),
  Updated_Turns = Turns ++ [{Guess, Feedback}],
  run(Secret_Code, Updated_Turns, game_decision(Updated_Turns));

run(Secret_Code, Turns, Game_Result) ->
  console_io:display_game_decision(Game_Result, Secret_Code).



game_decision(Turns) ->
  Game_Result = lists:filter(fun({X, Y}) -> Y == ["b","b","b","b"] end, Turns),
  Turn_Count = length(Turns),
  game_decision(Game_Result, Turn_Count).



game_decision([{_, ["b","b","b","b"]}], _) ->
  win;

game_decision(_, ?TOTAL_MOVES) ->
  lose;

game_decision(_, _) ->
  play.