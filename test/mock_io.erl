-module(mock_io).
-export([display/2, get_guess/1, get_play_again/0, display_welcome_message/0, display_invalid_selection/0, display_game_decision/2, display_gameboard/1]).



display(_, _) ->
  1.



get_guess() ->
  "gggg".



get_play_again() ->
  "n".



display_welcome_message() ->
  welcome_message.



display_invalid_selection() ->
  invalid_selection.



display_game_decision(win, _) ->
  win;

display_game_decision(lose, Secret_Code) ->
  lose.



display_gameboard(Turns) ->
  gameboard.