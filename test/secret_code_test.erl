-module(secret_code_test).
-include_lib("eunit/include/eunit.hrl").

-include("src/secret_code.hrl").

get_1_test() ->
  [{ "returns a secret code with a length of the configuration value",
      ?assertEqual(length(secret_code:get()), ?SECRET_CODE_LENGTH)
  }].

random_generator_1_test() ->
  [{ "returns no duplicate secret codes if run 1000 times",
      ?assert(secret_code:random_generator(0, 1000, []) < 400)
  }].

secret_code_available_symbols_1_test() ->
  [{ "returns only valid symbols for the secret code",
      ?assertEqual(lists:usort(secret_code:get()) -- lists:sublist(?SYMBOLS, ?SECRET_CODE_AVAILABLE_SYMBOLS), [])
  }].