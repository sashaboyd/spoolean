module Routes exposing (routes, Route)

import Home
import Html exposing (Html)
import Journeys exposing (..)


page : Journey -> model -> Html msg
page journey =
    case journey of
        Home ->
            Home.page

        _ ->
            Home.page
