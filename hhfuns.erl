-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(Func, [H|T]) -> [Func(H)|map(Func, T)].

tail_fact(N) -> tail_fact(N, 1).
tail_fact(1, Res) -> Res;
tail_fact(N, Res) -> tail_fact(N-1, Res * N).


%clojeres
base(A) ->
  B = A + 1,
  F = fun() -> A * B end,
  F().

a() ->
  Secret = "pony",
  fun() -> Secret end.

b(Func) ->
  "Secreit is " ++ Func().

power_of_base(Base) ->
  fun(X) -> math:pow(Base, X) end.

