-module(exceptions).
-export([throws/1, black_knight/1, sword/1, catcher/2]).

throws(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error};
    exit:Exit -> {exit, caught, Exit};
    Throw -> {throw, caught, Throw}
  end.

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None, Shall pass"
  catch
    throw:slice -> "It's but a scratch";
    error:cut_arm -> "I've had worse";
    exit:cut_leh -> "Come on you pansy";
    _:_ -> "He is deadd..."
  after
    io:format("Thx for game with us!\n")
  end.

catcher(X,Y) ->
  case catch X/Y of
    {'EXIT', {badarith,_}} -> "uh oh";
    N -> N
  end.
