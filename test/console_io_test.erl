-module(console_io_test).
-include_lib("eunit/include/eunit.hrl").

console_io_test() ->
  [
    { "write welcome message to Console",
      ?assertEqual(console_io:display_welcome_message(), ok)
    },

    { "writes the gameboard to the Console",
      ?assertEqual(console_io:display_gameboard(), ok)
    }
  ].
