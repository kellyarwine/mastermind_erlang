-module(prompter).
-export([prompt/1, guess/1]).

prompt(Message) ->
  io:format(Message).

gets() ->
  {_, [Input]} = io:fread("Enter:  ", "~s"),
  Input.

guess(input) ->
  Guess_Input = gets(),
  Guess_List = convert_guess_to_list(Guess_Input).

convert_guess_to_list(Guess_Input) ->
  re:split(Guess_Input, "", [{return, list}, trim]).