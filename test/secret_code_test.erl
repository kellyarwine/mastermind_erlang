-module(secret_code_test).
-include_lib("eunit/include/eunit.hrl").

-include("src/secret_code.hrl").

random_generator(I, Limit, Secret_Codes) when I =< Limit ->
  Updated_Secret_Codes = Secret_Codes ++ [secret_code:get()],
  random_generator(I + 1, Limit, Updated_Secret_Codes);

random_generator(_, Limit, Secret_Codes) ->
  Secret_Code_Duplicates = Limit - length(lists:usort(Secret_Codes)).




get_1_test() ->
  [{ "returns a secret code with a length of the configuration value",
      ?assertEqual(length(secret_code:get()), ?SECRET_CODE_LENGTH)
  }].

random_generator_1_test() ->
  [{ "returns no duplicate secret codes if run 1000 times",
      ?assert(random_generator(0, 1000, []) < 400)
  }].

secret_code_available_symbols_1_test() ->
  [{ "returns only valid symbols for the secret code",
      ?assertEqual(lists:usort(secret_code:get()) -- lists:sublist(?SYMBOLS, ?SECRET_CODE_AVAILABLE_SYMBOLS), [])
  }].