-module(feedback).
-export([generate/2]).

generate(Guess, Secret_Code) ->
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