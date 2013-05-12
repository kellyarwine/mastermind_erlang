-module(prompter).
-export([prompt/1, guess/0, next_run/0]).

prompt(Message) ->
  console_io:gets(Message).

run(8) ->
  21.

next_run() ->
  run(8).

gets() ->
  {_, [Input]} = io:fread("Enter:  ", "~s"),
  Input.

guess() ->
  Guess_Input = gets(),
  Guess_List = convert_guess_to_list(Guess_Input).

convert_guess_to_list(Guess_Input) ->
  re:split(Guess_Input, "", [{return, list}, trim]).