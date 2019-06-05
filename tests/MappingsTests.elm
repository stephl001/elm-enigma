module MappingsTests exposing (suite)

import Array exposing (empty)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, string)
import Letter exposing (fromLetterList, toLetterList)
import Mappings exposing (Mappings)
import Random.Array exposing (shuffle)
import Test exposing (..)

suite : Test
suite =
    describe "The Mappings module"
        [ describe "An identity mapping"
            -- Nest as many descriptions as you like.
            [ test "should always map a letter into itself" <|
                \_ ->
                    Expect.equal True True
            ]
        ]
