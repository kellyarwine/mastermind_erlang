-module(prompter_test).
-include_lib("eunit/include/eunit.hrl").




guess_1_test() ->
  meck:new(prompter),
  meck:expect(prompter, prompt, fun("Please enter a guess: ", [12, ["a","b","c","d","e","f"]]) -> "aaaa" end),
  ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"]),
  ?assert(meck:validate(prompter)),
  meck:unload(prompter).




  % [{ "returns a valid guess",
  %     meck:new(prompter),
  %     meck:expect(prompter, prompt, fun() -> "aaaa" end),
  %     ?assertEqual(prompter:prompt,"aaaa")
  % }].

% validate_guess_1_test() ->
%   [{ "returns false when the guess is invalid",
%       ?assertEqual(prompter:validate_guess(["g","g","g"], ["b","g","p","r","y","o"]), false)
%   }].

% validate_guess_2_test() ->
%   [{ "returns false when the guess is invalid",
%       ?assertEqual(prompter:validate_guess(["."], ["b","g","p","r","y","o"]), false)
%   }].

% validate_guess_3_test() ->
%   [{ "returns false when the guess is invalid",
%       ?assertEqual(prompter:validate_guess([" ", " "], ["b","g","p","r","y","o"]), false)
%   }].

% validate_guess_4_test() ->
%   [{ "returns false when the guess is invalid",
%       ?assertEqual(prompter:validate_guess(["a","a","a","a"], ["b","g","p","r","y","o"]), false)
%   }].

% validate_guess_5_test() ->
%   [{ "returns false when the guess is invalid",
%       ?assertEqual(prompter:validate_guess(["1","2","2","3"], ["b","g","p","r","y","o"]), false)
%   }].

% validate_guess_6_test() ->
%   [{ "returns true when the guess is valid",
%       ?assertEqual(prompter:validate_guess(["g","p","g","p"], ["b","g","p","r","y","o"]), true)
%   }].