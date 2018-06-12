module Main exposing (..)

import Home
import Html exposing (Html, text, div, h1, img)
import Logos exposing (Progress, pagePosToProgress)
import Ports exposing (Move, scroll)
import Task
import Window


---- MODEL ----


type alias Model =
    { viewportSize : Window.Size
    , logoAnimationProgress : Progress
    }


init : ( Model, Cmd Msg )
init =
    ( { viewportSize = { width = 360, height = 480 } -- assume mobile by default
      , logoAnimationProgress = 0
      }
    , Task.perform WindowResized (Window.size)
    )



---- UPDATE ----


type Msg
    = NoOp
    | WindowResized Window.Size
    | Scrolled Move


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

        NoOp ->
            ( model, Cmd.none )


adjustSize size =
    { size
        | width = min 600 size.width
        , height = size.height - 24
    }



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Window.resizes WindowResized
        , scroll Scrolled
        ]



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Home.page model.viewportSize model.logoAnimationProgress
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
