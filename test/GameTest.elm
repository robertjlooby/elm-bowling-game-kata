module GameTest where

import Game exposing (..)
import Check.Investigator exposing (investigator, rangeInt)
import Check.Test
import ElmTest.Assertion exposing (assertEqual, assert, Assertion)
import ElmTest.Test exposing (test, suite)
import Random exposing (initialSeed)
import Shrink exposing (list)

tests =
  suite "Game"
    [ test "gutter game scores 0"
        (List.repeat 20 0
          |> score
          |> assertEqual 0)

    , test "all ones scores 20"
        (List.repeat 20 1
          |> score
          |> assertEqual 20)

    , Check.Test.test "scores any non-bonus game"
        score
        List.sum
        (randRolls <| rangeInt 0 4)
        100
        (initialSeed 1)

    , test "scores one spare"
        (List.repeat 17 0
          |> List.append [5, 5, 3]
          |> score
          |> assertEqual 16)

    , test "scores one strike"
        (List.repeat 17 0
          |> List.append [10, 4, 3]
          |> score
          |> assertEqual 24)

    , test "scores a perfect game"
        (List.repeat 12 10
          |> score
          |> assertEqual 300)
    ]


randRolls inv =
  investigator
    (Random.list 20 inv.generator)
    (list inv.shrinker)
