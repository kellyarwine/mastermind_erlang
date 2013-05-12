-module(feedback).
-export([get/4, get/2]).



get(Guess, Secret_Code) ->
  get(0, Guess, Secret_Code, []).

get(Curr_Position, Guess, Secret_Code, Feedback) when Curr_Position < length(Guess) ->
  New_Curr_Position = Curr_Position + 1,
  Curr_Guess = lists:nth(New_Curr_Position, Guess),
  match(Curr_Guess, New_Curr_Position, Guess, Secret_Code, Feedback);

get(_, _, _, Feedback) ->
  sort(Feedback).



sort(Feedback) ->
  lists:sort(Feedback).



match(Curr_Guess, Curr_Position, Guess, Secret_Code, Feedback) ->
  Curr_Secret_Code = lists:nth(Curr_Position, Secret_Code),
  Difference = [Curr_Guess] -- Secret_Code,
  match(Curr_Position, Guess, Secret_Code, Feedback, Curr_Guess, Curr_Secret_Code, Difference).



match(Curr_Position, Guess, Secret_Code, Feedback, Curr_Guess, Curr_Secret_Code, Difference)
  when Curr_Guess == Curr_Secret_Code ->
    Updated_Feedback = Feedback ++ ["b"],
    Updated_Secret_Code = lists:sublist(Secret_Code, Curr_Position - 1) ++ ["v"] ++ lists:nthtail(Curr_Position, Secret_Code),
    get(Curr_Position, Guess, Updated_Secret_Code, Updated_Feedback);

match(Curr_Position, Guess, Secret_Code, Feedback, Curr_Guess, Curr_Secret_Code, Difference)
  when Difference == [] ->
    Updated_Feedback = Feedback ++ ["w"],
    Curr_Guess = lists:nth(Curr_Position, Guess),
    Curr_Position_of_Secret_Code = index_of(Curr_Guess, Secret_Code),
    Updated_Secret_Code = lists:sublist(Secret_Code, Curr_Position_of_Secret_Code - 1) ++ ["x"] ++ lists:nthtail(Curr_Position_of_Secret_Code, Secret_Code),
    get(Curr_Position, Guess, Updated_Secret_Code, Updated_Feedback);

match(Curr_Position, Guess, Secret_Code, Feedback, Curr_Guess, Curr_Secret_Code, Difference) ->
  Updated_Feedback = Feedback ++ [" "],
  get(Curr_Position, Guess, Secret_Code, Updated_Feedback).



index_of(Item, List) -> index_of(Item, List, 1).
  index_of(_, [], _)  -> not_found;

  index_of(Item, [Item|_], Index) -> Index;

  index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).