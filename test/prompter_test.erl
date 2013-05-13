-module(prompter_test).
-include_lib("eunit/include/eunit.hrl").

        guess_1_test() ->
          meck:new(prompter, [passthrough]),
          meck:expect(prompter, gets, fun() -> "aaaa" end),
          % meck:expect(prompter, gets, fun() -> meck:passthrough(["aaaa"]) end),
          ?assertEqual(prompter:gets(), "aaaa"),
          ?assert(meck:validate(prompter)),
          meck:unload(prompter).

        % guess_2_test() ->
        %   meck:new(prompter),
        %   meck:expect(prompter, run, fun(8) -> 21 end),
        %   ?assertEqual(prompter:next_run(), 21),
        %   ?assert(meck:validate(prompter)),
        %   meck:unload(prompter).


prompt_test() ->
  [{ "test prompt",
      ?assertEqual(prompter:prompt("hi"), ok)
  }].


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