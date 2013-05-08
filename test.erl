-module(test_mod).
-export([generate/2]).

generate(Number) ->
  recurse(Number).

recurse(Number) when Number < 10 ->
  Updated_Number = Number * 2,
  recurse(Updated_Number);
recurse(Number) ->
  Number.