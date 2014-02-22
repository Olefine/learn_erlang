-module(statements).
-compile(export_all).

filter(Func, [H|T]) ->
  case Func(H) of
    true -> [H|filter(Func, T)];
    false -> filter(Func, T)
  end;
filter(Func, []) -> [].

map_by_func(Func, [H|T]) ->
  List1 = [],
  List2 = [],
  case Func(H) of
    true -> List1 ++ [H|Func(T)];
    false -> List2 ++ [Func(T)]
  end.
