-module(game_runner_test).
-include_lib("eunit/include/eunit.hrl").

call_test() ->
  meck:new(secret_code),
  meck:expect(secret_code, get, fun() -> ["a","a","a","a"] end),
  ?assertEqual(mastermind:start(mock_io), win),
  meck:unload(secret_code).

call_2_test() ->
  meck:new(secret_code),
  meck:expect(secret_code, get, fun() -> ["a","a","a","a"] end),
  ?assertEqual(start_game(), win),
  meck:unload(secret_code).
