module Main where

import ElmTest.Runner.Console exposing (runDisplay)
import ElmTest.Test exposing (Test, suite)
import IO.IO exposing (..)
import IO.Runner exposing (Request, Response)

import GameTest

tests : Test
tests =
  suite
    "All elm-bowling-game-kata specs"
    [ GameTest.tests
    ]

console : IO ()
console = runDisplay tests

port requests : Signal Request
port requests = IO.Runner.run responses console

port responses : Signal Response
