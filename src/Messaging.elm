module Messaging exposing (Msg(..), init, update)

import Journeys
import Model exposing (Model, initialState)
import Ports exposing (Move)
import Task
import View.Logos exposing (pagePosToProgress)
import Window


type Msg
    = NoOp
    | WindowResized Window.Size
    | Scrolled Move
    | UpdateJourney Journeys.Msg


init : ( Model, Cmd Msg )
init =
    ( initialState
    , Task.perform WindowResized (Window.size)
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowResized size ->
            ( { model | viewportSize = adjustSize size }
            , Cmd.none
            )

        Scrolled ( oldPos, newPos ) ->
            ( { model | logoAnimationProgress = pagePosToProgress newPos }
            , Cmd.none
            )

        UpdateJourney journeyMsg ->
            liftMessages UpdateJourney (Journeys.update journeyMsg model)

        NoOp ->
            ( model, Cmd.none )


adjustSize : Window.Size -> Window.Size
adjustSize size =
    { size
        | width = min 600 size.width
        , height = size.height - 24
    }


liftMessages : (msg1 -> msg2) -> ( a, Cmd msg1 ) -> ( a, Cmd msg2 )
liftMessages =
    Tuple.mapSecond << Cmd.map
