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
    ]
