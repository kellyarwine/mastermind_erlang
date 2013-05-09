-module(console_io).
-export([display_welcome_message/0, gets/1]).


display(Message) ->
  io:format(Message).

gets(message) ->
  {ok, [X]} = io:fread(message, "~d").

display_welcome_message() ->
  io:format("Welcome to Mastermind").
