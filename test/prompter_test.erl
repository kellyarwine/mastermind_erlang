-module(prompter_test).
-include_lib("eunit/include/eunit.hrl").

guess_1_test() ->
          meck:new(gets),
          meck:expect(gets, response, fun() -> "aaaa" end),
          ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]),
          ?assert(meck:validate(gets)),
          meck:unload(gets).


% guess_1_test() ->
%   [{ "displays an invalid selection message, prompts the player for a guess, returns the guess in a list datatype and validates the guess",
%       ?assertEqual(prompter:guess("aaaa", 12, ["a","b","c","d","e","f"]), console_io:display_invalid_selection())
%       ?assertEqual(prompter:guess("aaaa", 12, ["a","b","c","d","e","f"]), prompter:prompt())
%       ?assertEqual(prompter:guess("aaaa", 12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
%       ?assertEqual(prompter:guess("aaaa", 12, ["a","b","c","d","e","f"]), prompter:validate_guess(["a","a","a","a"], 12, ["a","b","c","d","e","f"]))
%   }].

% validate_guess_1_test() ->
%   [{ "prompts for a new guess when the guess is only 3 characters and should be 4",
%       ?assertEqual(prompter:validate_guess(["g","g","g"], 12, ["a","b","c","d","e","f"]), prompter:guess(12, ["a","b","c","d","e","f"]))
%   }].

% validate_guess_2_test() ->
%   [{ "prompts for a new guess when the guess is not 4 valid symbols",
%       ?assertEqual(prompter:validate_guess(["."], 12, ["a","b","c","d","e","f"]), prompter:guess(12, ["a","b","c","d","e","f"]))
%   }].

% validate_guess_3_test() ->
%   [{ "prompts for a new guess when the guess is not 4 valid symbols",
%       ?assertEqual(prompter:validate_guess([" ", " "], 12, ["a","b","c","d","e","f"]), prompter:guess(12, ["a","b","c","d","e","f"]))
%   }].

% validate_guess_4_test() ->
%   [{ "prompts for a new guess when the guess is not 4 valid symbols",
%       ?assertEqual(prompter:validate_guess(["g","g","g","g"], 12, ["a","b","c","d","e","f"]), prompter:guess(12, ["a","b","c","d","e","f"]))
%   }].

% validate_guess_5_test() ->
%   [{ "prompts for a new guess when the guess is not 4 valid symbols",
%       ?assertEqual(prompter:validate_guess(["1","2","2","3"], 12, ["a","b","c","d","e","f"]), prompter:guess(12, ["a","b","c","d","e","f"]))
%   }].

validate_guess_6_test() ->
  [{ "returns the guess in a list datatype when the guess is valid",
      ?assertEqual(prompter:validate_guess(["e","f","e","f"], 12, ["a","b","c","d","e","f"]), ["e","f","e","f"])
  }].

% play_again_1_test() ->
%   [{ "prompts the player if they want to play again and validates the response",
%       ?assertEqual(prompter:play_again(), prompter:prompt())
%       ?assertEqual(prompter:play_again(), prompter:validate_play_again("y"))
%   }].

% validate_play_again_1_test() ->
%   [{ "displays an invalid selection message and prompts the player for a new play again response when the response is invalid",
%       ?assertEqual(prompter:validate_play_again("."), console_io:display_invalid_selection())
%       ?assertEqual(prompter:validate_play_again("."), prompter:prompt())
%   }].

% validate_play_again_2_test() ->
%   [{ "displays an invalid selection message and prompts the player for a new play again response when the response is invalid",
%       ?assertEqual(prompter:validate_play_again(" "), console_io:display_invalid_selection())
%       ?assertEqual(prompter:validate_play_again(" "), prompter:prompt())
%   }].

% validate_play_again_3_test() ->
%   [{ "displays an invalid selection message and prompts the player for a new play again response when the response is invalid",
%       ?assertEqual(prompter:validate_play_again("Y"), console_io:display_invalid_selection())
%       ?assertEqual(prompter:validate_play_again("Y"), prompter:prompt())
%   }].

% validate_play_again_4_test() ->
%   [{ "displays an invalid selection message and prompts the player for a new play again response when the response is invalid",
%       ?assertEqual(prompter:validate_play_again("yy"), console_io:display_invalid_selection())
%       ?assertEqual(prompter:validate_play_again("yy"), prompter:prompt())
%   }].

validate_play_again_5_test() ->
  [{ "returns the play again response when the response is valid",
      ?assertEqual(prompter:validate_play_again("y"), "y")
  }].