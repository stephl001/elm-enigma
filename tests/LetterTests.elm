module LetterTests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, string)
import Letter exposing (fromLetterList, toLetterList)
import Test exposing (..)


suite : Test
suite =
    let
        convertOnce =
            toLetterList >> fromLetterList
    in
    describe "The Letter module"
        [ describe "converting string to letter list"
            -- Nest as many descriptions as you like.
            [ fuzz string "should yield the same list over and over" <|
                \randomString ->
                    let
                        convertTwice =
                            convertOnce >> convertOnce
                    in
                    Expect.equal
                        (convertOnce randomString)
                        (convertTwice randomString)
            , fuzz string "should contain only letters once converted" <|
                \randomString ->
                    let
                        isCapitalizedLetter : Char -> Bool
                        isCapitalizedLetter c =
                            Char.isUpper c && Char.isAlpha c
                    in
                    Expect.true
                        "Expected all characters to be capitalized latters after conversion"
                        (convertOnce randomString |> String.all isCapitalizedLetter)
            ]
        ]
