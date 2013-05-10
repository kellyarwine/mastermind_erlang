-module(console_io).
-export([display_welcome_message/0, display_gameboard/0]).

display(Message) ->
  io:format(Message).

gets(Message) ->
  {ok, [X]} = io:fread(Message, "~s"),
  io:format("~s~n", [X]),
  X.

get_move() ->
  Move = gets("Please enter your guess: "),
  re:split(Move, "", [{return,list}, trim]).

display_welcome_message() ->
  display("Welcome to Mastermind!  Get ready to play!~n").

display_gameboard() ->
  display(
  board_header() ++
  board_headings() ++
  board_footer()
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

% board_row(move_history)
%   string = ""
%   move_history.each do |move|
%     string << left_edge_border + parse_move(move) + border + "\n"
%   end
%   string
% end

% def parse_move(move)
%   string = ""
%   string << parse_move_part(move.first)
%   string << border
%   string << parse_move_part(move.last)
%   string
% end

% def parse_move_part(part)
%   string = ""

%   part.each { |char| string << ("%0" + space_per_character.to_s + "s") % char }

%   string
% end

% def space_per_character
%   7
% end

% def border
%   ("%0" + (space_per_character + 1).to_s + "s") % "|"
% end

left_edge_border() ->
  "|".

board_footer() ->
  "|                                   |                                   |
 -----------------------------------------------------------------------
".