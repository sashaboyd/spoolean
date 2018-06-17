module View.Structure exposing (header, animatedContainer, pageContainer)

import Css exposing (..)
import Html.Styled as Html
    exposing
        ( Html
        , h1
        , nav
        , ul
        , li
        , a
        , text
        , div
        , styled
        )
import Html.Styled.Attributes exposing (css, href, src)
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
    Html.header
        [ css
            [ displayFlex
            , justifyContent flexEnd
            , position fixed
            , top (Css.rem 1)
            , left zero
            , right zero
            , width (pct 100)
            , maxWidth (Css.rem 39)
            , height (Css.rem 7)
            , margin auto
            ]
        ]
        [ h1 [] [ text "Sasha Boyd" ]
        , menu []
            [ menuList [] (List.map makeMenuItem mainRoutes) ]
        ]


menu : List (Html.Attribute Msg) -> List (Html Msg) -> Html Msg
menu =
    styled nav
        [ displayFlex
        , width (pct 100)
        , maxWidth (Css.rem 24)
        ]


menuList : List (Html.Attribute Msg) -> List (Html Msg) -> Html Msg
menuList =
    styled ul
        [ displayFlex
        , width (pct 100)
        , padding zero
        , listStyleType none
        , flexFlow2 row noWrap
        , justifyContent spaceAround
        ]


makeMenuItem : Journey -> Html Messaging.Msg
makeMenuItem journey =
    styled li [] [] [ Html.map UpdateJourney (entryLink journey) ]


animatedContainer : Progress -> Size -> List (Html Msg) -> Html Msg
animatedContainer progress size contents =
    div
        [ css
            [ displayFlex
            ]
        ]
        [ header
        , banner size progress
        , Html.main_ [] contents
        ]


pageContainer : Size -> List (Html Msg) -> Html Msg
pageContainer size =
    animatedContainer 1.0 size
