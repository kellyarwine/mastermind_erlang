-module(test_mod_tests).
-include_lib("eunit/include/eunit.hrl").

test_mod_test() ->
  [
    { "returns ",
      ?assertEqual(test_mod:generate(4), 8)
    },

    { "returns ",
      ?assertEqual(1, 1)
    }
  ].