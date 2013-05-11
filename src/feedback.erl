-module(feedback).
-export([get/3, get/2]).

get(Guess, Secret_Code) ->
  get(Guess, 1, Secret_Code).

get([Curr_Guess|Rem_Guess], Curr_Position, Secret_Code) ->
  lists:sort(
    match(Curr_Guess, Curr_Position, Secret_Code) ++ get(Rem_Guess, Curr_Position + 1, Secret_Code)
            );
get([], Curr_Position, Secret_Code) ->
  [].

match(Curr_Guess, Curr_Position, Secret_Code) ->

  io:format("The current guess is: ~p ~n", [Curr_Guess]),
  io:format("The secret code is: ~p ~n", [Secret_Code]),

  Difference = [Curr_Guess] -- Secret_Code,

  io:format("The difference is: ~p ~n", [Difference]),

  Curr_Secret_Code = lists:nth(Curr_Position, Secret_Code),

  io:format("The current secret code is: ~p ~n", [Curr_Secret_Code]),

  if
    Curr_Guess == Curr_Secret_Code -> ["b"];
    Difference == []               -> ["w"];
    true                           -> [" "]
  end.
