module Main exposing (..)

import Home
import Html exposing (Html, text, div, h1, img)
import Task
import Window


---- MODEL ----


type alias Model =
    { viewportSize : Window.Size
    }


init : ( Model, Cmd Msg )
init =
    ( { viewportSize = { width = 360, height = 480 } -- assume mobile by default
      }
    , Task.perform WindowResized (Window.size)
    )



---- UPDATE ----


type Msg
    = NoOp
    | WindowResized Window.Size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowResized size ->
            ( { model | viewportSize = size }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Home.page model.viewportSize 1.0
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always (Window.resizes WindowResized)
        }
