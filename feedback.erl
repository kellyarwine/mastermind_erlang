-module(feedback).
-export([generate/2]).

generate(Guess, Secret_Code) ->
  exact_match(Guess, Secret_Code, [], 1).
   % near_match(Updated_Guess, Updated_Secret_Code, Feedback, 1).

% exact_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Feedback, Updated_Guess, Updated_Secret_Code) when Curr_Guess == Curr_Secret_Code ->
%   exact_match(Rem_Guess, Rem_Secret_Code, Feedback ++ ["b"], Updated_Guess ++ ["z"], Updated_Secret_Code ++ ["x"]);

% exact_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Feedback, Updated_Guess, Updated_Secret_Code) ->
%   exact_match(Rem_Guess, Rem_Secret_Code, Feedback, Updated_Guess ++ [Curr_Guess], Updated_Secret_Code ++ [Curr_Secret_Code]);

% exact_match([], [], Feedback, _, _) ->
%   generate()


exact_match([Curr_Guess|Rem_Guess], [Curr_Secret_Code|Rem_Secret_Code], Feedback, Index) when Curr_Guess == Curr_Secret_Code ->
  Updated_Guess = lists:sublist(Guess, Index - 1) ++ "z" ++ lists:nthtail(Index, Guess),
  Updated_Secret_Code = lists:sublist(Secret_Code, Index - 1) ++ "x" ++ lists:nthtail(Index, Secret_Code),
  exact_match(Updated_Guess, Updated_Secret_Code, Feedback ++ ["b"], Index + 1);

exact_match(Guess, Secret_Code, Feedback, Index) when length(Guess) >= Index ->
  exact_match(Guess, Secret_Code, Feedback, Index + 1);

exact_match(_, _, Feedback, _) ->
  Feedback.


% near_match([Curr_Guess|Rem_Guess], Secret_Code, Feedback, Index) when [Curr_Guess] - Secret_Code == [] ->
%   Index = Index + 1,
%   Secret_Code = lists:sublist(Secret_Code, Index - 1) ++ "x" ++ lists:nthtail(Index, Secret_Code),
%   near_match(Rem_Guess, Secret_Code, Feedback ++ ["w"], Index);

%   near_match([Curr_Guess|Rem_Guess], Secret_Code, Feedback, Index) when [Curr_Guess] - Secret_Code =/= [] ->
%   Index = Index + 1,
%   near_match(Rem_Guess, Secret_Code, Feedback ++ [" "], Index);

%   near_match([], [], Feedback, _) ->
%   Feedback.