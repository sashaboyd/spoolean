module View.Structure exposing (header, animatedContainer, pageContainer)

import Html exposing (Html, h1, nav, ul, li, a, text, div)
import Html.Attributes exposing (href, class)
import Journeys exposing (Journey(..), entryLink)
import List
import Messaging exposing (Msg(UpdateJourney))
import View.Banner exposing (banner)
import View.Logos exposing (Progress)
import Window exposing (Size)


mainRoutes : List Journey
mainRoutes =
    [ Home, About, Personal, Engineering ]


header : Html Msg
header =
    Html.header []
        [ h1 [ class "screen-reader-text" ] [ text "Sasha Boyd" ]
        , nav []
            [ ul [] (List.map makeNavLink mainRoutes) ]
        ]


makeNavLink : Journey -> Html Messaging.Msg
makeNavLink journey =
    li [] [ Html.map UpdateJourney (entryLink journey) ]


animatedContainer : Progress -> Size -> List (Html Msg) -> Html Msg
animatedContainer progress size contents =
    div [ class "container" ]
        [ header
        , banner size progress
        , Html.main_ [] contents
        ]


pageContainer : Size -> List (Html Msg) -> Html Msg
pageContainer size =
    animatedContainer 1.0 size
