module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (addOne)
import Test exposing (..)


suite : Test
suite =
    describe "The main module"
        [ describe "addOne"
            -- Nest as many descriptions as you like.
            [ fuzz int "called twice should add 2 to any numbers" <|
                \randomNumber ->
                    let
                        newNumber =
                            addOne (addOne randomNumber)
                    in
                    Expect.equal (randomNumber + 2) newNumber
            ]
        ]
