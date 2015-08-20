module Game where

import List exposing (sum, take)

score rolls =
  case rolls of
    [_, _, _] as lastFrame ->
      sum lastFrame
    10::rest ->
      10 + strikeBonus rest + score rest
    first::second::rest ->
      if | first + second == 10 ->
             10 + spareBonus rest + score rest
         | otherwise ->
             first + second + score rest
    [] -> 0
    [_] -> 0

bonus numRolls rolls =
  take numRolls rolls |> sum

spareBonus = bonus 1
strikeBonus = bonus 2
