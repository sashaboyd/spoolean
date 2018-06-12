module Home exposing (page)

import Html exposing (Html)
import Logos exposing (logos)
import Svg
    exposing
        ( svg
        , g
        , title
        , defs
        , rect
        )
import Svg.Attributes
    exposing
        ( d
        , transform
        , height
        , width
        , version
        , viewBox
        , opacity
        , x
        , y
        , fill
        )


smallLogoLength : Float
smallLogoLength =
    830


largeLogoLength : Float
largeLogoLength =
    1200


overallWidth =
    360


page : { height : Int, width : Int } -> Float -> Html msg
page size position =
    let
        w =
            toString (max size.width 360)

        h =
            toString (max (size.height - 5) 480)

        left =
            (toFloat size.width / 2)
                |> toString

        lineLength =
            smallLogoLength + (largeLogoLength - smallLogoLength) * position

        linePosition =
            0 - position * 1100

        thickness =
            toString (round (1 + 2 * position))
    in
        svg
            [ width w
            , height h
            , version "1.1"
            , viewBox ("0 0 " ++ w ++ " " ++ h)
            ]
            [ g
                [ transform ("translate(" ++ left ++ " 0)")
                ]
                ([ rect
                    [ opacity ".5"
                    , transform "translate(-60 260) rotate(45, 75, 75)"
                    , height "120"
                    , width "120"
                    , fill "#ffb8ab"
                    ]
                    []
                 ]
                    ++ (logos size position)
                )
            ]
