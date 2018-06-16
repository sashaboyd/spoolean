module Main exposing (..)

import Home
import Html exposing (Html, text, div, h1, img)
import Messaging exposing (Msg(..), init, update)
import Model exposing (Model)
import Ports exposing (scroll)
import View.Logos exposing (Progress, pagePosToProgress)
import Window


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
        [ Home.page model
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
