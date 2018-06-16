module Model exposing (Model, initialState)

import View.Logos exposing (Progress)
import Window


type alias Model =
    { viewportSize : Window.Size
    , logoAnimationProgress : Progress
    }


initialState : Model
initialState =
    { viewportSize = { width = 360, height = 480 } -- assume mobile by default
    , logoAnimationProgress = 0
    }
