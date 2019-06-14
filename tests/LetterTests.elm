module LetterTests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, string)
import Letter exposing (fromLetterList, toLetterList)
import Test exposing (..)


suite : Test
suite =
    describe "The Letter module"
        [ describe "all letters"
            [ Test.todo "should yield a unique index"
            , Test.todo "should yield a unique capitalized letter char once converted"
            , Test.todo "should be creatable from any char in the range [a-zA-Z] "
            ]
        , describe "all indexes up to 25"
            [ Test.todo "should yield a unique letter" ]
        , describe "converting string to letter list"
            [ Test.todo "should yield the same list over and over"
            , Test.todo "should contain only letters once converted"
            ]
        ]
