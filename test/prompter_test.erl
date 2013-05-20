-module(prompter_test).
-include_lib("eunit/include/eunit.hrl").

guess_suite_test() ->
  {foreach,
    fun() ->
      meck:new(gets)
    end,
    fun(_) ->
      meck:unload(gets)
    end,

    {"returns guess when a valid guess is input",
      fun() ->
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after an invalid guess of 3 valid symbols is input instead of 4",
      fun() ->
        meck:expect(gets, response, fun() -> "aaa" end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after an invalid period is input as a guess",
      fun() ->
        meck:expect(gets, response, fun() -> "." end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after an invalid space is input as a guess",
      fun() ->
        meck:expect(gets, response, fun() -> " " end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after a 4 invalid characters are input as a guess",
      fun() ->
        meck:expect(gets, response, fun() -> "gggg" end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after a 4 invalid integers are input as a guess",
      fun() ->
        meck:expect(gets, response, fun() -> "1234" end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    },
    {"returns a valid guess after a 4 invalid capitalized characters are input as a guess",
      fun() ->
        meck:expect(gets, response, fun() -> "BBBB" end),
        meck:expect(gets, response, fun() -> "aaaa" end),
        ?assertEqual(prompter:guess(12, ["a","b","c","d","e","f"]), ["a","a","a","a"])
      end
    }
  }.

guess_1() ->
  guess(mock_io, 1, ["a","b","c","d","e","f"]),

call_test() ->
  meck:new(secret_code),
  meck:expect(secret_code, get, fun() -> ["a","a","a","a"] end),
  ?assertEqual(mastermind:start(mock_io), win),
  meck:unload(secret_code).



% guess_1_test() ->
%   [{ "displays an invalid selection message when guess is invalid",
%       ?assertEqual(1,1)
%   }].

play_again_suite_test() ->
  {foreach,
    fun() ->
      meck:new(gets)
    end,
    fun(_) ->
      meck:unload(gets)
    end,

    {"returns a valid play again response of 'y' when a valid play again response of 'y' is input",
      fun() ->
        meck:expect(gets, response, fun() -> "y" end),
        ?assertEqual(prompter:play_again(), "y")
      end
    },
    {"returns a valid play again response of 'n' when a valid play again response of 'n' is input",
      fun() ->
        meck:expect(gets, response, fun() -> "n" end),
        ?assertEqual(prompter:play_again(), "n")
      end
    },
    {"returns a valid play again response of 'y' after an invalid ' ' is input",
      fun() ->
        meck:expect(gets, response, fun() -> " " end),
        meck:expect(gets, response, fun() -> "y" end),
        ?assertEqual(prompter:play_again(), "y")
      end
    },
    {"returns a valid play again response of 'y' after an invalid '.' is input",
      fun() ->
        meck:expect(gets, response, fun() -> "." end),
        meck:expect(gets, response, fun() -> "y" end),
        ?assertEqual(prompter:play_again(), "y")
      end
    },
    {"returns a valid play again response of 'y' after an invalid '3' is input",
      fun() ->
        meck:expect(gets, response, fun() -> "3" end),
        meck:expect(gets, response, fun() -> "y" end),
        ?assertEqual(prompter:play_again(), "y")
      end
    },
    {"returns a valid play again response of 'y' after an invalid 'Y' is input",
      fun() ->
        meck:expect(gets, response, fun() -> "Y" end),
        meck:expect(gets, response, fun() -> "y" end),
        ?assertEqual(prompter:play_again(), "y")
      end
    }
  }.

% play_again_1_test() ->
%   [{ "displays a 'prompt for play again' message when the response is invalid",
%       ?assertEqual(1,1)
%   }].

% play_again_1_test() ->
%   [{ "displays an invalid selection message when the response is invalid",
%       ?assertEqual(1,1)
%   }].