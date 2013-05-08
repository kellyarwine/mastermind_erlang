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

% takes first guess and matches to first code
near_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|_], Secret_Code, Feedback, Index)
  when Curr_Guess == Curr_Secret_Code ->
    Incremented_Index = Index + 1,
    Updated_Secret_Code = lists:sublist(Secret_Code, Incremented_Index) ++ ["x"] ++ lists:nthtail(Incremented_Index, Secret_Code),
    erlang:display(function2),
    erlang:display("Secret_Code is:"),
    erlang:display(Secret_Code),
    erlang:display("Feedback is:"),
    erlang:display(Feedback),
    erlang:display("Guess is:"),
    erlang:display([Curr_Guess|Rem_Guess]),
    erlang:display("Curr_Secret_Code is:"),
    erlang:display(Curr_Secret_Code),
    erlang:display("Updated_Secret_Code is:"),
    erlang:display(Updated_Secret_Code),
    near_match(Rem_Guess, Updated_Secret_Code, Updated_Secret_Code, Feedback ++ ["w"], Incremented_Index);

%  if first guess doesn't match first code then send it all in again cycling to second code
near_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Secret_Code, Feedback, Index)
  when Curr_Guess =/= Curr_Secret_Code ->
    erlang:display(function3),
    near_match([Curr_Guess|Rem_Guess], Rem_Secret_Code, Secret_Code, Feedback, Index);

%  when you get to end of guess symbols then send rest of guess and reset secret code back again
near_match([Curr_Guess|Rem_Guess], [], Secret_Code, Feedback, Index) ->
  erlang:display(function4),
  Incremented_Index = Index + 1,
  near_match(Rem_Guess, Secret_Code, Secret_Code, Feedback, Incremented_Index);

%  when you get to end of guess symbols, return answer
near_match([], _, _, Feedback, _) ->
  erlang:display(function5),
  Feedback.