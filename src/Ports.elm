port module Ports exposing (scroll, Move)


type alias Move =
    ( Float, Float )


port scroll : (Move -> msg) -> Sub msg
