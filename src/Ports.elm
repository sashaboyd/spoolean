port module Ports exposing (scroll)


type alias Move =
    ( Float, Float )


port scroll : (Move -> msg) -> Sub msg
