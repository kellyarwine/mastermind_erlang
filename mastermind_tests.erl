-module(mastermind_tests).
-include_lib("eunit/include/eunit.hrl").

% game module tests
game_test() ->
  [
    { "test",
      ?assertEqual(1,1)
    }
  ].





% console_io module tests
console_io_test() ->
  [
    { "write welcome message to Console",
      ?assertEqual(mastermind:display_welcome_message(), ok)
    }
  ].





% feedback module tests
exact_match_test() ->
  [
    { "returns all black symbols when the user's guess matches the secret code in color and position
       (i.e., exact match)",
      ?assertEqual(mastermind:get_feedback(["r", "r", "r", "r"], ["r", "r", "r", "r"]), ["b", "b", "b", "b"])
    },

    { "returns 3 black symbols when the user's guess has 3 exact matches and 1 no match",
      ?assertEqual(mastermind:get_feedback(["r", "r", "r", "y"], ["r", "r", "r", "r"]), ["b", "b", "b"])
    },

    { "returns 2 black symbols when the user's guess has 2 exact matches and 2 no matches",
      ?assertEqual(mastermind:get_feedback(["r", "r", "o", "o"], ["r", "r", "r", "r"]), ["b", "b"])
    },

    { "returns 1 black symbols when the user's guess has exact match and 3 no matches",
      ?assertEqual(mastermind:get_feedback(["r","o","o"], ["r","r","y"]), ["b"])
    }
  ].

near_match_test() ->
  [
    { "returns all white symbols when the user's entire guess matches in color but not position
       (i.e., near match) to the secret code",
      ?assertEqual(mastermind:get_feedback(["r", "r", "y", "y"], ["y", "y", "r", "r"]), ["w", "w", "w", "w"])
    },

    { "returns 1 white symbols when the user's guess has 1 near match and 3 no matches",
      ?assertEqual(mastermind:get_feedback(["r", "y", "r", "r"], ["p", "p", "p", "y"]), ["w"])
    },

    { "returns 2 white symbols when the user's guess has 2 near matches and 2 no matches",
      ?assertEqual(mastermind:get_feedback(["y", "y", "r", "r"], ["p", "p", "y", "y"]), ["w","w"])
    },

    { "returns 3 white symbols when the user's guess has 3 near matches and 1 no match",
      ?assertEqual(mastermind:get_feedback(["o", "y", "p", "r"], ["p", "p", "r", "y"]), ["w","w","w"])
    }
  ].

no_match_test() ->
  [
    { "returns a blank list when the user's entire guess does not match any color
       (and, thus, any position) of the secret code",
      ?assertEqual(mastermind:get_feedback(["r", "r", "r", "r"], ["y", "y", "y", "y"]), [])
    }
  ].

mixed_match_test() ->
  [
    { "returns 3 white symbols and 1 black symbol when the user's guess has 3 near matches and 1 exact match",
      ?assertEqual(mastermind:get_feedback(["o", "y", "p", "r"], ["o", "p", "r", "y"]), ["b","w","w","w"])
    },

    { "returns 2 white symbols and 2 black symbols when the user's guess has 2 near matches and 2 exact matches",
      ?assertEqual(mastermind:get_feedback(["o", "p", "y", "r"], ["o", "p", "r", "y"]), ["b","b","w","w"])
    },

    { "returns 1 white symbol, 1 black symbol and 2 no match symbols when the user's guess has 1 near match, 1 exact match and 2 no matches",
      ?assertEqual(mastermind:get_feedback(["o", "b", "y", "b"], ["o", "g", "g", "y"]), ["b","w"])
    }
  ].

duplicate_colors_in_guess_but_not_secret_code_test() ->
  [
    { "returns only one exact match when the exact match symbol is duplicated in the guess",
      ?assertEqual(mastermind:get_feedback(["o", "o", "y", "y"], ["o", "r", "b", "r"]), ["b"])
    },

    { "returns one near match when the near match symbol is duplicated in the guess",
      ?assertEqual(mastermind:get_feedback(["o", "o", "y", "y"], ["r", "r", "o", "r"]), ["w"])
    },

    { "returns one near match when the near match symbol is input 3 times in the guess",
      ?assertEqual(mastermind:get_feedback(["o", "o", "o", "y"], ["r", "r", "r", "o"]), ["w"])
    }
  ].




% secret_code module tests
secret_code_test() ->
  [
    { "returns a secret code with a length of 4",
      ?assertEqual(length(mastermind:get_code()), 4)
    },
    { "returns a secret code containing only valid symbols",
      ?assertEqual(mastermind:symbols() -- ["b","g","p","r","y","o"], [])
    },
    % { "returns a randomly generated secret code",
    %   ?assertEqual(1, 1)
    % },
    { "returns the symbols available for the secret code",
      ?assertEqual(mastermind:symbols(), ["b","g","p","r","y","o"])
    }
  ].

symbols_test() ->
  [
    { "returns the symbols available for the secret code",
      ?assertEqual(mastermind:symbols(), ["b","g","p","r","y","o"])
    }
  ].