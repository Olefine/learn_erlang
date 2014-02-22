-module(control).
-export([for/3, sum/1, map/2, max/2, even_map/2]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) ->
  [F(I)|for(I+1, Max, F)].

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

map([H|T], Func) ->
  [Func(H)|map(T, Func)];
map([], Func) -> [].

max(X, Y) when X > Y -> X;
max(X, Y) -> Y.

even_map([H|T], Func) when (H rem 1 =:= 0) ->
  map([H|T], Func).
