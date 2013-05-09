-module(test_mod).
-export([generate/1, iterate/1]).

generate(Number) ->
  recurse(Number).

recurse(Number) when Number < 10 ->
  Updated_Number = Number * 2,
  recurse(Updated_Number);

recurse(Number) ->
  Number + 1.

% another_recurse() when Updated_Number < 20 ->
%   erlang:display(done2),
%   erlang:display(Updated_Number),
%   Updated_Number_2 = Updated_Number * 2,
%   another_recurse();

% another_recurse() ->
%   Updated_Number_2.

iterate(Zebra) ->
  next_step(Zebra, 0).


next_step([Curr_Zebra|Rem_Zebra], Accumulator) ->
  New_Accumulator = Accumulator + Curr_Zebra,
  next_step(Rem_Zebra, New_Accumulator);

next_step([], Accumulator) ->
  Accumulator.