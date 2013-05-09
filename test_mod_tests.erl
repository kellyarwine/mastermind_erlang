-module(test_mod_tests).
-include_lib("eunit/include/eunit.hrl").

test_mod_test() ->
  [
    { "returns ",
      ?assertEqual(test_mod:generate(4), 17)
    },

    { "returns ",
      ?assertEqual(test_mod:generate(2), 17)
    },

    { "returns ",
      ?assertEqual(test_mod:iterate([1,2,3,4]), 10)
    }
  ].