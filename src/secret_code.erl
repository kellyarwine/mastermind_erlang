-module(secret_code).
-export([get/0, symbols/0]).

get() ->
  random:seed(now()),
  [lists:nth(random:uniform(6), symbols()) || _ <- lists:seq(1, 4)].

symbols() ->
  ["b","g","p","r","y","o"].