module Home exposing (page)

import Html exposing (Html)
import Messaging exposing (Msg)
import View.Logos exposing (Progress)
import View.Structure exposing (animatedContainer)
import Window exposing (Size)


page :
    { viewportSize : Size
    , logoAnimationProgress : Progress
    }
    -> Html Msg
page { viewportSize, logoAnimationProgress } =
    animatedContainer logoAnimationProgress viewportSize []
