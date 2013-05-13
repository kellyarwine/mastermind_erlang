-module(gets).
-export([response/0]).


response() ->
  {_, [Input]} = io:fread("", "~s"),
  Input.