module Common exposing (randomLetter, randomMappings)

import Fuzz exposing (Fuzzer, intRange)
import Letter exposing (Letter(..), letterFromIndex)
import Mappings exposing (Mappings, safeMappingsFromLetters)
import Random
import Random.List exposing (shuffle)


shuffler : List a -> Fuzzer (List a)
shuffler list =
    Fuzz.int
        |> Fuzz.map
            (Random.initialSeed >> Random.step (Random.List.shuffle list) >> Tuple.first)


randomMappings : Fuzzer Mappings
randomMappings =
    Mappings.identityLetters
        |> shuffler
        |> Fuzz.map safeMappingsFromLetters


randomLetter : Fuzzer Letter
randomLetter =
    intRange 0 25
        |> Fuzz.map (letterFromIndex >> Maybe.withDefault A)
