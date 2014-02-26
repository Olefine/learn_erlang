-module(tutorial_concurency).
-export([start/0, say_something/2]).

say_something(_What, 0) -> done;
say_something(What, N) ->
  io:format("~p ~n", [What]),
  say_something(What, N - 1).

start() ->
  spawn(tutorial_concurency, say_something, [hello, 5]),
  spawn(tutorial_concurency, say_something, [goodbye, 5]).
