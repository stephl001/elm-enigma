module MappingsTests exposing (suite)

import Array exposing (empty)
import Common exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, string)
import Letter exposing (Letter(..))
import Mappings exposing (Mappings, commonMappings)
import Random.Array exposing (shuffle)
import Test exposing (..)


suite : Test
suite =
    describe "The Mappings module"
        [ describe "An identity mapping"
            [ describe "with a forward mapper"
                [ test "should always map a letter into itself" <|
                    testIdentityMappings Mappings.mapLetter
                ]
            , describe "with a reverse mapper"
                [ test "should always map a letter into itself" <|
                    testIdentityMappings Mappings.reverseMapLetter
                ]
            ]
        , describe "When mapping a letter then the result and so on"
            [ describe "with a forward mapper"
                [ fuzz2 randomMappings randomLetter "should yield the original letter within 26 tries" <|
                    recursiveMapToSelf Mappings.mapLetter
                ]
            , describe "with a reverse mapper"
                [ fuzz2 randomMappings randomLetter "should yield the original letter within 26 tries" <|
                    recursiveMapToSelf Mappings.reverseMapLetter
                ]
            ]
        , describe "When mapping all letters using a non-identity mappings"
            [ fuzz nonIdentityRandomMappings "should yield a non-identity list of letters with a forward mapper" <|
                testNonIdentityMappings Mappings.mapLetter
            , fuzz nonIdentityRandomMappings "should yield a non-identity list of letters with a reverse mapper" <|
                testNonIdentityMappings Mappings.reverseMapLetter
            ]
        , describe "Mapping then reverse mapping a random letter with a random mapping"
            [ fuzz2 randomMappings randomLetter "should yield the original letter" <|
                \mappings letter ->
                    let
                        mapUnmap =
                            Mappings.mapLetter mappings >> Mappings.reverseMapLetter mappings
                    in
                    mapUnmap letter
                        |> Expect.equal letter
            ]
        ]


testIdentityMappings : (Mappings -> Letter -> Letter) -> a -> Expectation
testIdentityMappings mapperCreator _ =
    let
        mapper =
            mapperCreator commonMappings.identity

        identityLetters =
            [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
    in
    identityLetters
        |> List.map mapper
        |> Expect.equal identityLetters


testNonIdentityMappings : (Mappings -> Letter -> Letter) -> Mappings -> Expectation
testNonIdentityMappings mapperCreator mappings =
    let
        mapper =
            mapperCreator mappings

        identityLetters =
            [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
    in
    identityLetters
        |> List.map mapper
        |> Expect.notEqual identityLetters


recursiveMapToSelf : (Mappings -> Letter -> Letter) -> Mappings -> Letter -> Expectation
recursiveMapToSelf mapperCreator mappings startLetter =
    let
        mapper =
            mapperCreator mappings

        collector : ( Letter, Int ) -> Expectation
        collector ( currentLetter, iteration ) =
            let
                nextLetter =
                    mapper currentLetter
            in
            if iteration == 26 then
                Expect.fail "Expected a letter to mapped into itself at least once"

            else if nextLetter == startLetter then
                Expect.pass

            else
                collector ( nextLetter, iteration + 1 )
    in
    collector ( startLetter, 0 )
