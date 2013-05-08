-module(test_mod).
-export([generate/1]).

generate(Number) ->
  recurse(Number).

recurse(Number) when Number < 10 ->
  erlang:display(done1),
  Updated_Number = Number * 2,
  recurse(Updated_Number);
recurse(Number) ->
  Number.