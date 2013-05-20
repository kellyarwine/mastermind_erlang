-module(game_runner).
-export([call/1, play_again/2, play_again/1]).



call(IOModule) ->
  mastermind:start(IOModule),
  play_again(IOModule).



play_again(IOModule) ->
  Result = prompter:play_again(IOModule),
  play_again(IOModule, Result).



play_again(IOModule, "y") ->
  call(IOModule);

play_again(_, "n") ->
  ok.