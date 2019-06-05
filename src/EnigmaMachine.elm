module EnigmaMachine exposing (EnigmaMachine(..), Plugboard, Rotors)

import Letter exposing (Letter, LetterList)
import Mappings exposing (Mappings, commonMappings, mappingsFromString)
import Reflector exposing (Reflector, commonReflectors)
import Rotor exposing (Rotor, commonRotors)


type alias Rotors =
    { fast : Rotor
    , medium : Rotor
    , slow : Rotor
    , reflector : Reflector
    }


type Plugboard
    = Plugboard Mappings


createPlugboard : String -> Maybe Plugboard
createPlugboard _ =
    Nothing

plugBoardOrIdentity: String -> Plugboard
plugBoardOrIdentity =
    mappingsFromString >> Maybe.withDefault commonMappings.identity >> Plugboard


type EnigmaMachine
    = EnigmaMachine Plugboard Rotors


advanceScramblers : EnigmaMachine -> EnigmaMachine
advanceScramblers =
    identity


mapLetter : EnigmaMachine -> Letter -> Letter
mapLetter _ =
    identity


encode : EnigmaMachine -> LetterList -> LetterList
encode _ =
    identity


encodeString : EnigmaMachine -> String -> String
encodeString machine =
    Letter.toLetterList >> encode machine >> Letter.fromLetterList
