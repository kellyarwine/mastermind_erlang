.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean

MODS = console_io feedback mastermind secret_code

all:	compile

compile:	path
	erlc -o ebin/ src/*.erl
	erlc -o ebin/ test/*.erl

path:
	erlc -pa ebin/

clean:
	rm -rf ebin/*.beam
	rm -rf erl_crash.dump

run_test:
	erl -noshell -pa ebin \
	-eval 'eunit:test("ebin", [verbose]).' \
	-s init stop