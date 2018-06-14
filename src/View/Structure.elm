module View.Structure exposing (header, animatedContainer, pageContainer)

import Html exposing (Html, h1, nav, ul, li, a, text, div)
import Html.Attributes exposing (href, class)
import Journeys exposing (..)
import List
import View.Banner exposing (banner)
import View.Logos exposing (Progress)
import Window exposing (Size)


mainRoutes : List Journey
mainRoutes =
    [ Home, About, Personal Nothing, Engineering Nothing ]


header : Html msg
header =
    Html.header []
        [ h1 [ class "screen-reader-text" ] [ text "Sasha Boyd" ]
        , nav []
            [ ul [] (List.map makeNavLink mainRoutes) ]
        ]


makeNavLink : Journey -> Html msg
makeNavLink journey =
    li [] [ a [ href (link journey) ] [ text (label journey) ] ]


animatedContainer : Progress -> Size -> List (Html msg) -> Html msg
animatedContainer progress size contents =
    div [ class "container" ]
        [ header
        , banner size progress
        , Html.main_ [] contents
        ]


pageContainer : Size -> List (Html msg) -> Html msg
pageContainer size =
    animatedContainer 1.0 size
