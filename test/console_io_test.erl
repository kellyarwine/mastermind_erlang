-module(console_io_test).
-include_lib("eunit/include/eunit.hrl").

% console_io_test() ->
  % [
  %   { "write welcome message to Console",
  %     ?assertEqual(console_io:display_welcome_message(), ok)
  %   },

  %   { "writes the gameboard to the Console",
  %     ?assertEqual(console_io:display_gameboard([["a"],["b"]]), ok)
  %   }
  % ].

turn_data_test() ->
  [
    { "returns turns",
      ?assertEqual(console_io:turn_data([]), "")
    },

    { "returns turns",
      ?assertEqual(console_io:turn_data([{["a","a","a","a"],["b","b","b","b"]}]), "|      a      a      a      a       |      b      b      b      b       |\n")
    },

    { "returns turns",
      ?assertEqual(console_io:turn_data([{["a","a","a","a"],["b","b","b","b"]}, {["c","c","c","c"],["d","d","d","d"]}]), "|      a      a      a      a       |      b      b      b      b       |\n|      c      c      c      c       |      d      d      d      d       |\n")
    }
  ].