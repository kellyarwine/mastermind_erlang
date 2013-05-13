-module(secret_code).
-export([get/0, random_generator/3]).

-include("secret_code.hrl").



get() ->
  random:seed(now()),
  [lists:nth(random:uniform(?SECRET_CODE_AVAILABLE_SYMBOLS), ?SYMBOLS) || _ <- lists:seq(1, ?SECRET_CODE_LENGTH)].



random_generator(I, Limit, Secret_Codes) when I =< Limit ->
  Updated_Secret_Codes = Secret_Codes ++ [secret_code:get()],
  random_generator(I + 1, Limit, Updated_Secret_Codes);

random_generator(_, Limit, Secret_Codes) ->
  Secret_Code_Duplicates = Limit - length(lists:usort(Secret_Codes)).