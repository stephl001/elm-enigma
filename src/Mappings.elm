module Mappings exposing (CommonMappings(..), Mappings, ReflectorMappings(..), RotorMappings(..), mapLetter, mappingsFromString, toMappings)

import Array exposing (Array)
import Array.Extra as Array
import Letter exposing (Letter(..), LetterList, letterToIndex, toLetterList)
import Set exposing (fromList)


type Mappings
    = Mappings (Array Letter)
    | StringMappings String


type CommonMappings
    = Identity
    | Rotor RotorMappings
    | Reflector ReflectorMappings


type RotorMappings
    = RotorI
    | RotorII
    | RotorIII
    | RotorIV
    | RotorV
    | RotorVI
    | RotorVII
    | RotorVIII


type ReflectorMappings
    = ReflectorA
    | ReflectorB
    | ReflectorC


toMappings : CommonMappings -> Mappings
toMappings mappingId =
    case mappingId of
        Identity ->
            StringMappings "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

        Rotor RotorI ->
            StringMappings "EKMFLGDQVZNTOWYHXUSPAIBRCJ"

        Rotor RotorII ->
            StringMappings "AJDKSIRUXBLHWTMCQGZNPYFVOE"

        Rotor RotorIII ->
            StringMappings "BDFHJLCPRTXVZNYEIWGAKMUSQO"

        Rotor RotorIV ->
            StringMappings "ESOVPZJAYQUIRHXLNFTGKDCMWB"

        Rotor RotorV ->
            StringMappings "VZBRGITYUPSDNHLXAWMJQOFECK"

        Rotor RotorVI ->
            StringMappings "JPGVOUMFYQBENHZRDKASXLICTW"

        Rotor RotorVII ->
            StringMappings "NZJHGRCXMYSWBOUFAIVLPEKQDT"

        Rotor RotorVIII ->
            StringMappings "FKQHTLXOCBJSPDZRAMEWNIUYGV"

        Reflector ReflectorA ->
            StringMappings "EJMZALYXVBWFCRQUONTSPIKHGD"

        Reflector ReflectorB ->
            StringMappings "YRUHQSLDPXNGOKMIEBFZCWVJAT"

        Reflector reflectorCMappings ->
            StringMappings "FVPJIAOYEDRZXWGCTKUQSBNMHL"


toLetterArray : Mappings -> Array Letter
toLetterArray mappings =
    case mappings of
        Mappings letters ->
            letters

        StringMappings letters ->
            toLetterList letters |> Array.fromList


mappingsFromLetters : LetterList -> Maybe Mappings
mappingsFromLetters letters =
    Nothing


mappingsFromString : String -> Maybe Mappings
mappingsFromString =
    toLetterList >> mappingsFromLetters



{- Known Mappings from documentation -}


mapLetter : Mappings -> Letter -> Letter
mapLetter mappings letter =
    letter


reverseMapLetter : (Letter -> Letter) -> Letter -> Letter
reverseMapLetter fn =
    identity
