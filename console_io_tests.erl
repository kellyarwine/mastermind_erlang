-module(feedback_tests).
-include_lib("eunit/include/eunit.hrl").

exact_match_test() ->
  [
    { "returns all black symbols when the user's guess matches the secret code in color and position
       (i.e., exact match)",
      ?assertEqual(feedback:generate(["r", "r", "r", "r"], ["r", "r", "r", "r"]), ["b", "b", "b", "b"])
    },

    { "returns 3 black symbols when the user's guess has 3 exact matches and 1 no match",
      ?assertEqual(feedback:generate(["r", "r", "r", "y"], ["r", "r", "r", "r"]), ["b", "b", "b"])
    },

    { "returns 2 black symbols when the user's guess has 2 exact matches and 2 no matches",
      ?assertEqual(feedback:generate(["r", "r", "o", "o"], ["r", "r", "r", "r"]), ["b", "b"])
    },

    { "returns 1 black symbols when the user's guess has exact match and 3 no matches",
      ?assertEqual(feedback:generate(["r","o","o"], ["r","r","y"]), ["b"])
    }
  ].