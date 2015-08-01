module Game where

import List exposing (sum, take)

score rolls =
  case rolls of
    10::rest ->
      let bonus = take 2 rest |> sum
      in
          10 + bonus + score rest
    first::second::rest ->
      if | first + second == 10 ->
             let bonus = take 1 rest |> sum
             in
                 10 + bonus + score rest
         | otherwise ->
             first + second + score rest
    [] -> 0
    [_] -> 0
