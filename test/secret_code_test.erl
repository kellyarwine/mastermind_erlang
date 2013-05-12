-module(secret_code_test).
-include_lib("eunit/include/eunit.hrl").

secret_code_1_test() ->
  [{ "returns a secret code with a length of 4",
      ?assertEqual(length(secret_code:get()), 4)
  }].

% secret_code_2_test() ->
%   [{ "returns a randomly generated secret code",
%       ?assertEqual(1, 1)
%   }].

secret_code_3_test() ->
  [{ "returns only valid symbols for the secret code",
      ?assertEqual(lists:usort(secret_code:get()) -- ["b","g","p","r","y","o"], [])
  }].