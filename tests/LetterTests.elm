module LetterTests exposing (suite)

import Common exposing (expectAllMaybe, expectMaybe)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, string)
import Letter exposing (Letter(..), letterFromIndex, letterToIndex)
import Test exposing (..)


suite : Test
suite =
    describe "The Letter module"
        [ describe "indexes in the range [0,25]"
            [ test "should yield a unique letter" <|
                \_ ->
                    let
                        expectedList =
                            [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
                                |> List.map Just
                    in
                    List.range 0 25
                        |> List.map letterFromIndex
                        |> Expect.equal expectedList
            ]
        , describe "all letters"
            [ test "should yield a unique index" <|
                \_ ->
                    [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
                        |> List.map letterToIndex
                        |> Expect.equal (List.range 0 25)
            ]
        ]
