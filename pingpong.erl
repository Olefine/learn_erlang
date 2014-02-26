-module(pingpong).
-compile(export_all).

pinger() ->
  receive
    {From, {ping}} ->
      From ! pong,
      pinger();
    {From, {_Any}} ->
      From ! {error, bad_pattern},
      pinger()
  end.

start() -> spawn(pingpong, pinger, []).

rpc(Pid, Message) ->
  Pid ! {self(), {Message}},
  receive
    Response ->
      Response
  end.
