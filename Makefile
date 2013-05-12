all:	compile run_test run_game

compile:
	erlc -o ebin/ src/*.erl
	erlc -o ebin/ test/*.erl

run_test:
	erl -pa ebin \
	-env ERL_LIBS deps/ \
	-eval 'eunit:test("ebin").' \
	-s init stop

run_game:
	erl -noshell -pa ebin \
	-env ERL_LIBS deps/ \
	-eval "mastermind:start()." \
	-s init stop

clean:
	rm -rf ebin/*.beam
	rm -rf erl_crash.dump