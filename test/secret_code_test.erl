-module(secret_code_test).
-include_lib("eunit/include/eunit.hrl").

-include("src/secret_code.hrl").

secret_code_1_test() ->
  [{ "returns a secret code with a length of 4",
      ?assertEqual(length(secret_code:get()), ?SECRET_CODE_LENGTH)
  }].

% secret_code_2_test() ->
%   [{ "returns a randomly generated secret code",
%       ?assertEqual(1, 1)
%   }].

secret_code_3_test() ->
  [{ "returns only valid symbols for the secret code",
      ?assertEqual(lists:usort(secret_code:get()) -- lists:sublist(?SYMBOLS, ?SECRET_CODE_AVAILABLE_SYMBOLS), [])
  }].