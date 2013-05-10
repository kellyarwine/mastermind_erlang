-module(secret_code_test).
-include_lib("eunit/include/eunit.hrl").

secret_code_test() ->
  [
    { "returns a secret code with a length of 4",
      ?assertEqual(length(secret_code:get()), 4)
    },

    { "returns a secret code containing only valid symbols",
      ?assertEqual(secret_code:symbols() -- ["b","g","p","r","y","o"], [])
    },

    % { "returns a randomly generated secret code",
    %   ?assertEqual(1, 1)
    % },

    { "returns the symbols available for the secret code",
      ?assertEqual(secret_code:symbols(), ["b","g","p","r","y","o"])
    }
  ].

symbols_test() ->
  [
    { "returns the symbols available for the secret code",
      ?assertEqual(secret_code:symbols(), ["b","g","p","r","y","o"])
    }
  ].