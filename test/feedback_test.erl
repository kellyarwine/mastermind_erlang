-module(feedback_test).
-include_lib("eunit/include/eunit.hrl").

exact_match_test() ->
  [
    { "returns all black symbols when the user's guess matches the secret code in color and position
       (i.e., exact match)",
      ?assertEqual(feedback:get(["r", "r", "r", "r"], ["r", "r", "r", "r"]), ["b", "b", "b", "b"])
    },

    { "returns 3 black symbols when the user's guess has 3 exact matches and 1 no match",
      ?assertEqual(feedback:get(["r", "r", "r", "y"], ["r", "r", "r", "r"]), ["b", "b", "b"])
    },

    { "returns 2 black symbols when the user's guess has 2 exact matches and 2 no matches",
      ?assertEqual(feedback:get(["r", "r", "o", "o"], ["r", "r", "r", "r"]), ["b", "b"])
    },

    { "returns 1 black symbols when the user's guess has exact match and 3 no matches",
      ?assertEqual(feedback:get(["r","o","o"], ["r","r","y"]), ["b"])
    }
  ].

near_match_test() ->
  [
    { "returns all white symbols when the user's entire guess matches in color but not position
       (i.e., near match) to the secret code",
      ?assertEqual(feedback:get(["r", "r", "y", "y"], ["y", "y", "r", "r"]), ["w", "w", "w", "w"])
    },

    { "returns 1 white symbols when the user's guess has 1 near match and 3 no matches",
      ?assertEqual(feedback:get(["r", "y", "r", "r"], ["p", "p", "p", "y"]), ["w"])
    },

    { "returns 2 white symbols when the user's guess has 2 near matches and 2 no matches",
      ?assertEqual(feedback:get(["y", "y", "r", "r"], ["p", "p", "y", "y"]), ["w","w"])
    },

    { "returns 3 white symbols when the user's guess has 3 near matches and 1 no match",
      ?assertEqual(feedback:get(["o", "y", "p", "r"], ["p", "p", "r", "y"]), ["w","w","w"])
    }
  ].

no_match_test() ->
  [
    { "returns a blank list when the user's entire guess does not match any color
       (and, thus, any position) of the secret code",
      ?assertEqual(feedback:get(["r", "r", "r", "r"], ["y", "y", "y", "y"]), [])
    }
  ].

mixed_match_test() ->
  [
    { "returns 3 white symbols and 1 black symbol when the user's guess has 3 near matches and 1 exact match",
      ?assertEqual(feedback:get(["o", "y", "p", "r"], ["o", "p", "r", "y"]), ["b","w","w","w"])
    },

    { "returns 2 white symbols and 2 black symbols when the user's guess has 2 near matches and 2 exact matches",
      ?assertEqual(feedback:get(["o", "p", "y", "r"], ["o", "p", "r", "y"]), ["b","b","w","w"])
    },

    { "returns 1 white symbol, 1 black symbol and 2 no match symbols when the user's guess has 1 near match, 1 exact match and 2 no matches",
      ?assertEqual(feedback:get(["o", "b", "y", "b"], ["o", "g", "g", "y"]), ["b","w"])
    }
  ].

duplicate_colors_in_guess_but_not_secret_code_test() ->
  [
    { "returns only one exact match when the exact match symbol is duplicated in the guess",
      ?assertEqual(feedback:get(["o", "o", "y", "y"], ["o", "r", "b", "r"]), ["b"])
    },

    { "returns one near match when the near match symbol is duplicated in the guess",
      ?assertEqual(feedback:get(["o", "o", "y", "y"], ["r", "r", "o", "r"]), ["w"])
    },

    { "returns one near match when the near match symbol is input 3 times in the guess",
      ?assertEqual(feedback:get(["o", "o", "o", "y"], ["r", "r", "r", "o"]), ["w"])
    }
  ].