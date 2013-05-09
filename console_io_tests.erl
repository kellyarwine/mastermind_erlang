-module(console_io_tests).
-include_lib("eunit/include/eunit.hrl").

console_io_test() ->
  [
    { "write welcome message to Console",
      ?assertEqual(console_io:display_welcome_message(), ok)
    },

    { "write welcome message to Console",
      ?assertEqual(console_io:display("Welcome"), ok)
    }
  ].