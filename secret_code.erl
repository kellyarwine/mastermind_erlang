-module(secret_code).
-export([generate/0, symbols/0]).

generate() ->
  random:seed(now()),
  [lists:nth(random:uniform(6), symbols()) || _ <- lists:seq(1, 4)].

symbols() ->
  ["b","g","p","r","y","o"].