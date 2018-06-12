module Home exposing (page)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Logos exposing (logos, Progress)
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


overallWidth : Float
overallWidth =
    360


page : { height : Int, width : Int } -> Progress -> Html msg
page size progress =
    let
        w =
            toString (max size.width 360)

        h =
            toString (max (size.height - 5) 480)

        left =
            (toFloat size.width / 2)
                |> toString

        diamondOpacity =
            max 0 (0.5 - 0.6 * progress)
                |> toString

        diamondSize_ =
            120 * (1 - 0.1 * progress)

        diamondSize =
            diamondSize_ |> toString

        diamondTop =
            260
                + (120 - diamondSize_)
                / 2
                |> toString
    in
        svg
            [ width w
            , height h
            , version "1.1"
            , viewBox ("0 0 " ++ w ++ " " ++ h)
            , style
                [ ( "position", "fixed" )
                , ( "left", "0" )
                , ( "right", "0" )
                , ( "top", "0" )
                , ( "margin", "auto" )
                ]
            ]
            [ g
                [ transform ("translate(" ++ left ++ " 0)")
                ]
                ([ rect
                    [ opacity diamondOpacity
                    , transform ("translate(-60 " ++ diamondTop ++ ") rotate(45, 75, 75)")
                    , height diamondSize
                    , width diamondSize
                    , fill "#ffb8ab"
                    ]
                    []
                 ]
                    ++ (logos size progress)
                )
            ]
