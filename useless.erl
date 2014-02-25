-module(useless).
-compile(export_all).

hello() ->
  io:format("Hello world ~n").

greet(male, Name) ->
  io:format("Hello ~s, your gender is male!", [Name]);
greet(female, Name) ->
  io:format("Hello ~s, your gender is female!", [Name]);
greet(_, Name) ->
  io:format("Hello ~s", [Name]).


greet2(Gender, Name) ->
  if
    (Gender == male) ->
      io:format("Hello ~s, your gender is male!", [Name]);
    true -> io:format("Hello ~s, your gender is female!", [Name])
  end.

head([H|_]) -> H.
second([_, X|_]) -> X.
third([_, _, X|_]) -> X.

animal(Animal) ->
  Talk = if Animal == cat -> "Meow";
            Animal == dog -> "Gav";
            Animal == tree -> "I can't speak, i'm tree";
            true -> "fdafdaf"
         end,
         {Animal, "Says" ++ Talk ++ "!"}.

append_to_last(X, []) -> [X];
append_to_last(X, Set) ->
  case lists:member(X, Set) of
    true ->
      io:format("Value ~s alredy exists in set ", [erlang:integer_to_list(X)]),
      Set;
    false -> [Set|X]
  end.

factorial(1) -> 1;
factorial(N) ->
  N * factorial(N - 1).

len([]) -> 0;
len([_]) -> 1;
len([H|T]) ->
  len([H]) + len(T).

duplicate(1, Term) -> [Term];
duplicate(N, Term) when (N >= 1) -> [Term|duplicate(N-1, Term)].

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++[H].



tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Res) -> Res;
tail_reverse([H|T], Res) -> tail_reverse(T, [H|Res]).

sublist([], _) -> [];
sublist(List, 0) -> List;
sublist([H|T], N) when N >= 0 -> [H|sublist([T], N-1)].

tail_sublist(_List, N) when (N > erlang:length(_List) orelse N < 0) ->
  throw("Can't sublist, because N is wrong than list length");
tail_sublist(List, N) -> tail_sublist(List, N, []).

tail_sublist(_, 0, Res) -> Res;
tail_sublist([H|T], N, Res) -> tail_sublist(T, N-1, Res ++ [H]).

zip([], []) -> [];
zip([H1|T1], [H2|T2]) -> [[H1,H2]|zip(T1, T2)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, Res) -> Res;
tail_duplicate(N, Term, Res) -> tail_duplicate(N-1, Term, [Term|Res]).

tail_sum(List) -> tail_sum(List, 0).
tail_sum([], Res) -> Res;
tail_sum([H|T], Res) ->
  tail_sum(T, Res + H).

qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

pyphagors(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A*A + B*B =:= C*C
  ].



