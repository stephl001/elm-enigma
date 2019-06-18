module Common exposing (expectAllMaybe, expectMaybe, nonIdentityRandomMappings, randomLetter, randomMappings)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, intRange)
import Letter exposing (Letter(..), letterFromIndex)
import Mappings exposing (Mappings, identityLetters, safeMappingsFromLetters)
import Random
import Random.Extra exposing (filter)
import Random.List exposing (shuffle)


traverse : (a -> Maybe b) -> List a -> Maybe (List b)
traverse fn list =
    case list of
        [] ->
            Just []

        x :: xs ->
            Maybe.map2 (::) (fn x) (traverse fn xs)


expectMaybe : a -> Maybe a -> Expectation
expectMaybe val =
    Expect.equal (Just val)


expectAllMaybe : (a -> Maybe b) -> List b -> List a -> Expectation
expectAllMaybe fn listb lista =
    traverse fn lista
        |> expectMaybe listb


shuffler : (List a -> Bool) -> List a -> Fuzzer (List a)
shuffler predicate list =
    Fuzz.int
        |> Fuzz.map
            (Random.initialSeed >> Random.step (Random.List.shuffle list |> filter predicate) >> Tuple.first)


generateRandomMappings : (List Letter -> Bool) -> Fuzzer Mappings
generateRandomMappings predicate =
    Mappings.identityLetters
        |> shuffler predicate
        |> Fuzz.map safeMappingsFromLetters


randomMappings : Fuzzer Mappings
randomMappings =
    generateRandomMappings <| always True


nonIdentityRandomMappings : Fuzzer Mappings
nonIdentityRandomMappings =
    generateRandomMappings (not << (==) identityLetters)


randomLetter : Fuzzer Letter
randomLetter =
    intRange 0 25
        |> Fuzz.map (letterFromIndex >> Maybe.withDefault A)
