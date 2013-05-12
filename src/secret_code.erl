-module(secret_code).
-export([get/0]).

-include("secret_code.hrl").

get() ->
  random:seed(now()),
  [lists:nth(random:uniform(6), ?SYMBOLS) || _ <- lists:seq(1, 4)].