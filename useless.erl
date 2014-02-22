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
