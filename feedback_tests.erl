-module(feedback_tests).
-include_lib("eunit/include/eunit.hrl").

feedback_test() ->
  [
    { "returns all black symbols when the user's guess matches the secret code in color and position (i.e., exact match)",
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
    },

    { "returns all white symbols when the user's entire guess matches in color but not position (i.e., near match) to the secret code",
      ?assertEqual(feedback:generate(["r", "r", "y", "y"], ["y", "y", "r", "r"]), ["w", "w", "w", "w"])
    },

    { "returns a blank list when the user's entire guess does not match any color (and, thus, any position) of the secret code",
      ?assertEqual(feedback:generate(["r", "r", "r", "r"], ["y", "y", "y", "y"]), [" ", " ", " ", " "])
    },

    { "returns 1 white symbols when the user's guess has 1 near match and 3 no matches",
      ?assertEqual(1, 1)
    },

    { "returns 2 white symbols when the user's guess has 2 near matches and 2 no matches",
      ?assertEqual(1, 1)
    },

    { "returns 3 white symbols when the user's guess has 3 near matches and 1 no match",
      ?assertEqual(1, 1)
    },

    { "returns 3 white symbols when the user's guess has 3 near matches and 1 no match",
      ?assertEqual(1, 1)
    }
  ].