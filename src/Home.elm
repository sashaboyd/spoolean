module Home exposing (page)

import Html exposing (Html)
import View.Logos exposing (Progress)
import View.Structure exposing (animatedContainer)
import Window exposing (Size)


page :
    { viewportSize : Size
    , logoAnimationProgress : Progress
    }
    -> Html msg
page { viewportSize, logoAnimationProgress } =
    animatedContainer logoAnimationProgress viewportSize []
