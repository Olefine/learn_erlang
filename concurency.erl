-module(concurency).
-export([start/0, area/2, rpc/2, sleep/1, flush_buffer/0, start_priority/0, priority_receive/0]).

start() -> spawn(fun loop/0).
start_priority() -> spawn(fun priority_receive/0).
area(Pid, Data) -> rpc(Pid, Data).

loop()->
  receive
    {From, {rectangle, Width, Ht}} ->
      From ! {self(), Width*Ht},
      loop();
    {From, {circle, R}} ->
      From ! {self(), 3.14159 * R * R},
      loop();
    {From, {Other}} ->
      From ! {self(), {error, Other}},
      loop()
  end.

%remote procedure call — удалённый вызов процедуры
rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

sleep(Time) ->
  receive
    after Time ->
      true
  end.

%clear mailbox of process
flush_buffer() ->
  receive
    _Any ->
      flush_buffer()
    after 0 ->
      true
  end.

priority_receive() ->
  receive
    {From, {alarm, R}} ->
      From ! {self(), {alarm, R}},
      priority_receive()
  after 0 ->
    receive
      {From, Any} ->
        From ! {self(), Any},
        io:format("This is not priority operation~n"),
        priority_receive()
    end
  end.
