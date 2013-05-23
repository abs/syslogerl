all: deps compile

compile:
	./rebar compile

deps:
	./rebar get-deps

clean:
	rm -fr ebin
	./rebar clean
