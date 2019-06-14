module Reflector exposing (Reflector, commonReflectors)

import Letter exposing (Letter)
import Mappings exposing (Mappings, commonMappings)


type Reflector
    = Reflector Mappings


type alias CommonReflector =
    { reflectorA : Reflector
    , reflectorB : Reflector
    , reflectorC : Reflector
    }


commonReflectors : CommonReflector
commonReflectors =
    { reflectorA = Reflector commonMappings.reflectorA
    , reflectorB = Reflector commonMappings.reflectorB
    , reflectorC = Reflector commonMappings.reflectorC
    }


mapLetter : Reflector -> Letter -> Letter
mapLetter =
    always identity
