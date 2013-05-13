-module(prompter_test).
-include_lib("eunit/include/eunit.hrl").

guess_1_with_one_valid_guess_test() ->
          meck:new(gets),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_2_with_one_guess_of_3_valid_symbols_test() ->
          meck:expect(gets, response, fun() -> "aaa" end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_3_with_one_guess_of_1_invalid_symbols_test() ->
          meck:expect(gets, response, fun() -> "." end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_4_with_one_guess_of_1_space_test() ->
          meck:expect(gets, response, fun() -> " " end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_5_with_one_guess_of_4_invalid_symbols_test() ->
          meck:expect(gets, response, fun() -> "gggg" end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_6_with_one_guess_of_4_invalid_numbers_test() ->
          meck:expect(gets, response, fun() -> "1234" end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]).

guess_7_with_one_guess_of_4_capitalized_symbols_test() ->
          meck:expect(gets, response, fun() -> "BBBB" end),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]),
          meck:unload(gets).

% guess_8_display_a_prompt_for_guess_message_test() ->
%           meck:new(console_io),
%           meck:expect(console_io, display, fun("You have ~p moves remaining.~nPlease enter your guess from the following options: ~n~p~n(example: abcd)~n~n", [12, ["a","b","c","d","e","f"]]) -> ok end),
%           ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ok),
%           meck:unload(console_io).


% guess_1_test() ->
%   [{ "displays an invalid selection message when guess is invalid",
%       ?assertEqual(1,1)
%   }].

play_again_1_with_a_response_of_y_test() ->
          meck:new(gets),
          meck:expect(gets, response, fun() -> "y" end),
          ?assertEqual(prompter:play_again(), "y").

play_again_2_with_a_response_of_n_test() ->
          meck:expect(gets, response, fun() -> "n" end),
          ?assertEqual(prompter:play_again(), "n").

play_again_3_with_an_invalid_response_of_space_test() ->
          meck:expect(gets, response, fun() -> " " end),
          meck:expect(gets, response, fun() -> "y" end),
          ?assertEqual(prompter:play_again(), "y").

play_again_4_with_an_invalid_response_of_a_period_test() ->
          meck:expect(gets, response, fun() -> "." end),
          meck:expect(gets, response, fun() -> "y" end),
          ?assertEqual(prompter:play_again(), "y").

play_again_3_with_an_invalid_response_of_an_integer_test() ->
          meck:expect(gets, response, fun() -> "3" end),
          meck:expect(gets, response, fun() -> "y" end),
          ?assertEqual(prompter:play_again(), "y").

play_again_3_with_an_invalid_response_of_a_capitalized_y_test() ->
          meck:expect(gets, response, fun() -> "Y" end),
          meck:expect(gets, response, fun() -> "y" end),
          ?assertEqual(prompter:play_again(), "y"),
          meck:unload(gets).

% play_again_1_test() ->
%   [{ "displays a 'prompt for play again' message when the response is invalid",
%       ?assertEqual(1,1)
%   }].

% play_again_1_test() ->
%   [{ "displays an invalid selection message when the response is invalid",
%       ?assertEqual(1,1)
%   }].