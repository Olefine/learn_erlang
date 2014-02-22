-module(shop).
-compile([export_all]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total([]) -> 0.
total([{What, N}|T]) -> cost(What) * N + total(T);
