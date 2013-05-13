-module(mastermind_test).
-include_lib("eunit/include/eunit.hrl").

% start_1_test() ->
%   [{ "generates a secret code, displays a welcome message and runs the game",
%       ?assertEqual(mastermind:start(), secret_code:get()),
%       ?assertEqual(mastermind:start(), console_io:display_welcome_message()),
%       ?assertEqual(mastermind:start(), mastermind:run()).
%   }].

% run_1_test() ->
%   [{ "displays the gameboard, prompts for a guess, receives feedback, updates the turns and loops if the game is not over",
%       ?assertEqual(mastermind:run(), console_io:display_gameboard()),
%       ?assertEqual(mastermind:run(), prompter:guess(12, ["a","b","c","d","e","f"])),
%       ?assertEqual(mastermind:run(), feedback:get(["a","a","a","a"], ["b","b","b","b"])),
%       ?assertEqual(mastermind:run(), 1),
%       ?assertEqual(mastermind:run(), mastermind:run()),
%   }].

% run_2_test() ->
%   [{ "ends the game loop when the game is over",
%         ?assertEqual(mastermind:run(["a","a","a","a"],
%                                     [
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]},
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]},
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]}
%                                     ],
%                                     win)
%   }].

% run_3_test() ->
%   [{ "ends the game loop when the game is over",
%         ?assertEqual(mastermind:run(["a","a","a","a"],
%                                     [
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]},
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]},
%                                      {["a", "a", "a", "a"],[" ", " ", " ", " "]},
%                                      {["e", "e", "e", "e"],[" ", " ", " ", " "]},
%                                      {["c", "c", "c", "c"],[" ", " ", " ", " "]},
%                                      {["d", "d", "d", "d"],[" ", " ", " ", " "]}
%                                     ],
%                                     lose)
%   }].


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