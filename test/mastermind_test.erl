-module(mastermind_test).
-include_lib("eunit/include/eunit.hrl").

mastermind_test() ->
  [{ "test",
      ?assertEqual(1,1)
  }].

game_decision_1_test() ->
  [{ "returns true if there are 12 total turns in the Turns (history) variable",
      ?assertEqual(mastermind:game_decision([
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {["e", "e", "e", "e"],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],[" ", " ", " ", " "]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]},
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {["e", "e", "e", "e"],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],[" ", " ", " ", " "]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]},
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {["e", "e", "e", "e"],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],[" ", " ", " ", " "]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]}
                          ]), lose)
  }].

game_decision_2_test() ->
  [{ "returns true if any of the guesses match the secret code",
      ?assertEqual(mastermind:game_decision([
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {[" ", " ", " ", " "],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],["b", "b", "b", "b"]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]}
                          ]), win)
  }].

game_decision_3_test() ->
  [{ "returns false if the Feedback does not contain all black symbols and there are not 12 turns",
      ?assertEqual(mastermind:game_decision([
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {["e", "e", "e", "e"],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],[" ", " ", " ", " "]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]},
                             {["a", "a", "a", "a"],[" ", " ", " ", " "]},
                             {["e", "e", "e", "e"],[" ", " ", " ", " "]},
                             {["c", "c", "c", "c"],[" ", " ", " ", " "]},
                             {["d", "d", "d", "d"],[" ", " ", " ", " "]}
                          ]), play)
  }].