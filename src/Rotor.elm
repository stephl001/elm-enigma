module Rotor exposing (RingSettings, Rotor, RotorInitializer, commonRotors)

import Letter exposing (Letter(..))
import Mappings exposing (Mappings, commonMappings)


type NotchPosition
    = Single Letter
    | Double Letter Letter


type alias RingSettings =
    { ringOffset : Letter
    , ringPosition : Letter
    }


type Rotor
    = Rotor Mappings NotchPosition RingSettings


type alias RotorInitializer =
    RingSettings -> Rotor


type alias CommonRotors =
    { rotorI : RotorInitializer
    , rotorII : RotorInitializer
    , rotorIII : RotorInitializer
    , rotorIV : RotorInitializer
    , rotorV : RotorInitializer
    , rotorVI : RotorInitializer
    , rotorVII : RotorInitializer
    , rotorVIII : RotorInitializer
    }


commonRotors : CommonRotors
commonRotors =
    { rotorI = Rotor commonMappings.rotorI <| Single Q
    , rotorII = Rotor commonMappings.rotorII <| Single E
    , rotorIII = Rotor commonMappings.rotorIII <| Single V
    , rotorIV = Rotor commonMappings.rotorIV <| Single J
    , rotorV = Rotor commonMappings.rotorV <| Single Z
    , rotorVI = Rotor commonMappings.rotorVI <| Double Z M
    , rotorVII = Rotor commonMappings.rotorVII <| Double Z M
    , rotorVIII = Rotor commonMappings.rotorVIII <| Double Z M
    }


isInNotchPosition : Rotor -> Bool
isInNotchPosition _ =
    False


advanceRotor : Rotor -> Rotor
advanceRotor =
    identity


mapLetter : Rotor -> Letter -> Letter
mapLetter _ =
    identity
