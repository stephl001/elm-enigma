module Mappings exposing (Mappings, commonMappings, mapLetter, mappingsFromString, reverseMappings)

import Array exposing (Array)
import Array.Extra as Array
import Letter exposing (Letter(..), LetterList, letterToIndex, toLetterList)
import Set exposing (fromList)


type Mappings
    = Mappings (Array Letter)


mappingsFromLetters : LetterList -> Maybe Mappings
mappingsFromLetters letters =
    Nothing


mappingsFromString : String -> Maybe Mappings
mappingsFromString =
    toLetterList >> mappingsFromLetters



--Do not export mappingsFromList. Internal helper only.


mappingsFromList : LetterList -> Mappings
mappingsFromList =
    Array.fromList >> Mappings



{- Known Mappings from documentation -}


type alias CommonMappings =
    { identity : Mappings
    , rotorI : Mappings
    , rotorII : Mappings
    , rotorIII : Mappings
    , rotorIV : Mappings
    , rotorV : Mappings
    , rotorVI : Mappings
    , rotorVII : Mappings
    , rotorVIII : Mappings
    , reflectorA : Mappings
    , reflectorB : Mappings
    , reflectorC : Mappings
    }


identityMappings : Mappings
identityMappings =
    [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
        |> mappingsFromList


rotorIMappings : Mappings
rotorIMappings =
    [ E, K, M, F, L, G, D, Q, V, Z, N, T, O, W, Y, H, X, U, S, P, A, I, B, R, C, J ]
        |> mappingsFromList


rotorIIMappings : Mappings
rotorIIMappings =
    [ A, J, D, K, S, I, R, U, X, B, L, H, W, T, M, C, Q, G, Z, N, P, Y, F, V, O, E ]
        |> mappingsFromList


rotorIIIMappings : Mappings
rotorIIIMappings =
    [ B, D, F, H, J, L, C, P, R, T, X, V, Z, N, Y, E, I, W, G, A, K, M, U, S, Q, O ]
        |> mappingsFromList


rotorIVMappings : Mappings
rotorIVMappings =
    [ E, S, O, V, P, Z, J, A, Y, Q, U, I, R, H, X, L, N, F, T, G, K, D, C, M, W, B ]
        |> mappingsFromList


rotorVMappings : Mappings
rotorVMappings =
    [ V, Z, B, R, G, I, T, Y, U, P, S, D, N, H, L, X, A, W, M, J, Q, O, F, E, C, K ]
        |> mappingsFromList


rotorVIMappings : Mappings
rotorVIMappings =
    [ J, P, G, V, O, U, M, F, Y, Q, B, E, N, H, Z, R, D, K, A, S, X, L, I, C, T, W ]
        |> mappingsFromList


rotorVIIMappings : Mappings
rotorVIIMappings =
    [ N, Z, J, H, G, R, C, X, M, Y, S, W, B, O, U, F, A, I, V, L, P, E, K, Q, D, T ]
        |> mappingsFromList


rotorVIIIMappings : Mappings
rotorVIIIMappings =
    [ F, K, Q, H, T, L, X, O, C, B, J, S, P, D, Z, R, A, M, E, W, N, I, U, Y, G, V ]
        |> mappingsFromList


reflectorAMappings : Mappings
reflectorAMappings =
    [ E, J, M, Z, A, L, Y, X, V, B, W, F, C, R, Q, U, O, N, T, S, P, I, K, H, G, D ]
        |> mappingsFromList


reflectorBMappings : Mappings
reflectorBMappings =
    [ Y, R, U, H, Q, S, L, D, P, X, N, G, O, K, M, I, E, B, F, Z, C, W, V, J, A, T ]
        |> mappingsFromList


reflectorCMappings : Mappings
reflectorCMappings =
    [ F, V, P, J, I, A, O, Y, E, D, R, Z, X, W, G, C, T, K, U, Q, S, B, N, M, H, L ]
        |> mappingsFromList


commonMappings : CommonMappings
commonMappings =
    { identity = identityMappings
    , rotorI = rotorIMappings
    , rotorII = rotorIIMappings
    , rotorIII = rotorIIIMappings
    , rotorIV = rotorIVMappings
    , rotorV = rotorVMappings
    , rotorVI = rotorVIMappings
    , rotorVII = rotorVIIMappings
    , rotorVIII = rotorVIIIMappings
    , reflectorA = reflectorAMappings
    , reflectorB = reflectorBMappings
    , reflectorC = reflectorCMappings
    }


reverseMappings : Mappings -> Mappings
reverseMappings =
    identity


mapLetter : Mappings -> Letter -> Letter
mapLetter =
    always identity


reverseMapLetter : (Letter -> Letter) -> Letter -> Letter
reverseMapLetter =
    always identity
