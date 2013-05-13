-module(mastermind_test).
-include_lib("eunit/include/eunit.hrl").

start_1_with_1_game_loop_and_a_play_again_response_of_n_test() ->
          meck:new(secret_code),
          meck:new(prompter),
          meck:new(feedback),
          meck:new(console_io),
          meck:expect(secret_code, get, fun() -> ["a","a","a","a"] end),
          meck:expect(console_io, display_welcome_message, fun() -> ok end),
          meck:expect(console_io, display_gameboard, fun([]) -> ok end),
          meck:expect(prompter, guess, fun(12, ["a","b","c","d","e","f"]) -> ["a","a","a","a"] end),
          meck:expect(feedback, get, fun(["a","a","a","a"], ["a","a","a","a"]) -> ["b","b","b","b"] end),
          meck:expect(console_io, display_game_decision, fun(win, ["a","a","a","a"]) -> player_wins end),
          ?assertEqual(mastermind:start(), player_wins),
          meck:unload(console_io),
          meck:unload(feedback),
          meck:unload(prompter),
          meck:unload(secret_code).

% start_2_with_1_game_loop_and_a_play_again_response_of_y_test() ->
%           meck:new(secret_code),
%           meck:new(prompter),
%           meck:new(feedback),
%           meck:new(console_io),
%           meck:expect(secret_code, get, fun() -> ["a","a","a","a"] end),
%           meck:expect(console_io, display_welcome_message, fun() -> ok end),
%           meck:expect(console_io, display_gameboard, fun([]) -> ok end),
%           meck:expect(prompter, guess, fun(12, ["a","b","c","d","e","f"]) -> ["b","b","b","b"] end),
%           meck:expect(feedback, get, fun(["a","a","a","a"], ["b","b","b","b"]) -> [" "," "," "," "] end),
%           meck:expect(console_io, display_game_decision, fun(lose, ["a","a","a","a"]) -> player_loses end),
%           ?assertEqual(mastermind:start(), player_loses),
%           meck:unload(console_io),
%           meck:unload(feedback),
%           meck:unload(prompter),
%           meck:unload(secret_code).

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