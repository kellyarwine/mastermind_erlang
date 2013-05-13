-module(console_io_test).
-include_lib("eunit/include/eunit.hrl").

% get_guess_test() ->
%   [{ "",
%       ?assertEqual(1,1)
%   }].

display_1_test() ->
  [{ "writes a message to Console",
      ?assertEqual(console_io:display("hi ~s", ["aaa"]), ok)
  }].

gets_1_test() ->
  [{ "writes a message to Console",
      ?assertEqual(console_io:display("hi ~s", ["aaa"]), ok)
  }].

display_welcome_message_test() ->
  [{ "writes welcome message to Console",
      ?assertEqual(console_io:display_welcome_message(), ok)
  }].

display_game_decision_1_test() ->
  [{ "writes win message to Console",
      ?assertEqual(console_io:display_game_decision(win, ["b","b","b","b"]), ok)
  }].

display_game_decision_2_test() ->
  [{ "writes lose message to Console",
      ?assertEqual(console_io:display_game_decision(lose, ["a","a","a","a"]), ok)
  }].

display_gameboard_test() ->
  [{ "writes gameboard to Console",
      ?assertEqual(console_io:display_gameboard([{["a","a","a","a"],["b","b","b","b"]}]), ok)
  }].

turn_data_1_test() ->
  [{ "returns no rows of data when no turn data exists",
      ?assertEqual(console_io:turn_data([]), "")
  }].

turn_data_2_test() ->
  [{ "returns one row of formatted data when one turn has been taken",
      ?assertEqual(console_io:turn_data([{["a","a","a","a"],["b","b","b","b"]}]), "|      a      a      a      a       |      b      b      b      b       |\n")
  }].

turn_data_3_test() ->
  [{ "returns two rows of formatted data when two turns have been taken",
      ?assertEqual(console_io:turn_data([{["a","a","a","a"],["b","b","b","b"]}, {["c","c","c","c"],["d","d","d","d"]}]), "|      a      a      a      a       |      b      b      b      b       |\n|      c      c      c      c       |      d      d      d      d       |\n")
  }].