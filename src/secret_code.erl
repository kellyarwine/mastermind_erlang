-module(secret_code).
-export([get/0]).

-include("secret_code.hrl").

get() ->
  random:seed(now()),
  [lists:nth(random:uniform(?SECRET_CODE_AVAILABLE_SYMBOLS), ?SYMBOLS) || _ <- lists:seq(1, ?SECRET_CODE_LENGTH)].