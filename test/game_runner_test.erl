-module(game_runner_test).
-include_lib("eunit/include/eunit.hrl").

call_1_with_a_play_again_response_of_n_test() ->
          meck:new(mastermind),
          meck:new(prompter),
          meck:expect(mastermind, start, fun() -> 1 end),
          meck:expect(prompter, play_again, fun() -> "n" end),
          ?assertEqual(game_runner:call(), ok),
          meck:unload(prompter),
          meck:unload(mastermind).

% this test runs in an infinite loop
% call_2_with_a play_again_response_of_y_test() ->
%           meck:expect(mastermind, start, fun() -> 1 end),
%           meck:expect(prompter, play_again, fun() -> "y" end),
%           ?assertEqual(game_runner:call(), ???).