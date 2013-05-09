-module(mastermind).
-export([start_game/0, run_game/2]).
-export([display/1, display_welcome_message/0, gets/1]).
-export([get_feedback/2]).
-export([get_code/0, symbols/0]).
-define(TOTAL_MOVES, 12).

start_game() ->
  Secret_Code = get_code(),
  display_welcome_message(),
  set_moves_remaining(),
  run_game([], Secret_Code).

run_game(Guess, Secret_Code) when Guess =/= Secret_Code ->
    display_gameboard(),
    New_Guess = get_move(),
    Feedback = get_feedback(New_Guess, Secret_Code),
    io:format("The secret code is: ~p ~n", [Secret_Code]),
    io:format("The guess is: ~p ~n", [New_Guess]),
    io:format("The feedback is: ~p ~n", [Feedback]),
    run_game(Guess, Secret_Code);
run_game(Guess, Secret_Code) when Guess == Secret_Code ->
  io:format("You win!").

  %    store_turn()
  %    decrement_moves_remaining()
  %   end
  % end

  % end_game ->
    % def end_game
    %   display_gameboard
    %   game_win? ? display_win_message : display_lose_message
    % end





%  console_io module
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



% game module
set_moves_remaining() ->
  % io:format("~s~n", ?TOTAL_MOVES).
  ?TOTAL_MOVES.





% feedback module
get_feedback(Guess, Secret_Code) ->
  exact_match(Guess, Secret_Code, [], [], []).

exact_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Feedback, Updated_Guess, Updated_Secret_Code)
  when Curr_Guess == Curr_Secret_Code ->
    exact_match(Rem_Guess, Rem_Secret_Code, Feedback ++ ["b"], Updated_Guess ++ ["z"], Updated_Secret_Code ++ ["x"]);

exact_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Feedback, Updated_Guess, Updated_Secret_Code) ->
  exact_match(Rem_Guess, Rem_Secret_Code, Feedback, Updated_Guess ++ [Curr_Guess], Updated_Secret_Code ++ [Curr_Secret_Code]);

exact_match([], [], Feedback, Updated_Guess, Updated_Secret_Code) ->
  near_match(Updated_Guess, Updated_Secret_Code, Updated_Secret_Code, Feedback, 1).


near_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|_], Secret_Code, Feedback, Index)
  when Curr_Guess == Curr_Secret_Code ->
    Updated_Secret_Code = lists:sublist(Secret_Code, Index - 1) ++ ["x"] ++ lists:nthtail(Index, Secret_Code),
    near_match(Rem_Guess, Updated_Secret_Code, Updated_Secret_Code, Feedback ++ ["w"], 1);

near_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Secret_Code, Feedback, Index)
  when Curr_Guess =/= Curr_Secret_Code ->
    Incremented_Index = Index + 1,
    near_match([Curr_Guess|Rem_Guess], Rem_Secret_Code, Secret_Code, Feedback, Incremented_Index);

near_match([_|Rem_Guess], [], Secret_Code, Feedback, _) ->
  near_match(Rem_Guess, Secret_Code, Secret_Code, Feedback, 1);

near_match([], _, _, Feedback, _) ->
  Feedback.





% secret_code module
get_code() ->
  random:seed(now()),
  Code = [lists:nth(random:uniform(6), symbols()) || _ <- lists:seq(1, 4)].

symbols() ->
  ["b","g","p","r","y","o"].