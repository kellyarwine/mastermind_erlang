-module(console_io).
-export([gets/2, display/2, display_welcome_message/0, display_invalid_selection/0, display_game_decision/2, display_gameboard/1, turn_data/1]).
-define(SPACES_PER_CHARACTER, 6).
-define(LEFT_EDGE_BORDER, "|").
-define(WELCOME_MESSAGE, "~nWelcome to Mastermind!  Get ready to play!~n").
-define(INVALID_SELECTION_MESSAGE, "\nYour input was invalid.  Please try again.\n\n").
-define(WIN_MESSAGE, "Woohoo!  You win!\n").
-define(LOSE_MESSAGE, "\nThe secret code was: ~p .\nLoser!\n").



display(Message, Args) ->
  io:format(Message, Args).



display_welcome_message() ->
  display(?WELCOME_MESSAGE, []).



display_invalid_selection() ->
  display(?INVALID_SELECTION_MESSAGE, []).



display_game_decision(win, _) ->
  display(?WIN_MESSAGE, []);

display_game_decision(lose, Secret_Code) ->
  display(?LOSE_MESSAGE, [Secret_Code]).



display_gameboard(Turns) ->
  display(
  board_header() ++
  board_headings() ++
  turn_data(Turns) ++
  board_footer(),
  []
        ).



board_header() ->
  "
 -----------------------------------------------------------------------
|                                            .                          |
|                                           .o8                         |
|    ooo. .oo.  .oo.    .oooo.    .oooo.o .o888oo  .ooooo.  oooo d8b    |
|     888P Y88bP Y88b   P  )88b  d88(   8   888   d88   88b  888  8P    |
|     888   888   888   .oP 888    Y88b.    888   888ooo888  888        |
|     888   888   888  d8(  888  o.  )88b   888 . 888    .o  888        |
|    o888o o888o o888o  Y8888 8o 8oo888P'    888   Y8bod8P  d888b       |
|                                                                       |
|                                o8o                    .o8             |
|                                8o8                    888             |
|             ooo. .oo.  .oo.   oooo  ooo. .oo.    .oooo888             |
|              888P Y88bP Y88b  `888   888P Y88b  d88   888             |
|              888   888   888   888   888   888  888   888             |
|              888   888   888   888   888   888  888   888             |
|             o888o o888o o888o o888o o888o o888o  oY8bod8o             |
 -----------------------------------------------------------------------
|                                   |                                   |
".



board_headings() ->
  "|                TURN               |             FEEDBACK              |
|                                   |                                   |
 -----------------------------------------------------------------------
|                                   |                                   |
".



turn_data([Curr_Turn|Rem_Turns]) ->
  format_turn(Curr_Turn) ++ "\n" ++ turn_data(Rem_Turns);
turn_data([]) ->
  [].



format_turn({Guess, Feedback}) ->
  Buffer = string:copies(" ", ?SPACES_PER_CHARACTER),
  ?LEFT_EDGE_BORDER ++ Buffer ++ string:join(Guess, Buffer) ++ Buffer ++ " " ++ ?LEFT_EDGE_BORDER ++ Buffer ++ string:join(Feedback, Buffer) ++ Buffer ++ " " ++ ?LEFT_EDGE_BORDER.



board_footer() ->
  "|                                   |                                   |
 -----------------------------------------------------------------------
".