module GameTest where

import Game exposing (..)
import ElmTest.Assertion exposing (assertEqual, assert, Assertion)
import ElmTest.Test exposing (test, suite)

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

    , test "scores one spare"
        (List.repeat 17 0
          |> List.append [5, 5, 3]
          |> score
          |> assertEqual 16)
    ]
