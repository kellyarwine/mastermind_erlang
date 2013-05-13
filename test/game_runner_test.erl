-module(game_runner_test).
-include_lib("eunit/include/eunit.hrl").


% call_1_test() ->
%   [{ "starts the game and prompts the player to play again once the game is over",
%       ?assertEqual(game_runner:call(), mastermind:start())
%       ?assertEqual(game_runner:call(), play_again())
%   }].

% play_again_1_test() ->
%   [{ "the player is prompted to play again and if 'y', then a new game is started",
%       ?assertEqual(game_runner:play_again(), prompter:play_again())
%       ?assertEqual(game_runner:play_again("y"), play_again:call())
%   }].

% play_again_2_test() ->
%   [{ "the player is prompted to play again and if 'n', then the game ends",
%       ?assertEqual(game_runner:play_again(), prompter:play_again())
%       ?assertEqual(game_runner:play_again("n"), ok)
%   }].