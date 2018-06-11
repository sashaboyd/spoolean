module HomeLogos exposing (logos)

import Html exposing (Html)
import Svg exposing (svg, g, title)
import Svg.Attributes
    exposing
        ( d
        , transform
        , height
        , width
        , version
        , viewBox
        , strokeDashoffset
        , strokeLinecap
        , strokeDasharray
        , stroke
        , strokeWidth
        , fill
        )


smallLogoLength : Float
smallLogoLength =
    830


largeLogoLength : Float
largeLogoLength =
    1200


logos : Float -> Float -> Float -> Html msg
logos h w position =
    let
        lineLength =
            smallLogoLength + (largeLogoLength - smallLogoLength) * position

        linePosition =
            0 - position * 1100
    in
        svg
            [ height (toString h)
            , width (toString w)
            , version "1.1"
            , viewBox ("0 0 " ++ toString w ++ " " ++ toString h)
            ]
            [ g
                [ stroke "#f53f1d"
                , strokeWidth "3"
                , transform "translate(0 -5.7e2)"
                ]
                [ g
                    [ transform "translate(-9.4 1.9e2)"
                    ]
                    [ title [] []
                    ]
                , Svg.path
                    [ strokeDashoffset (toString linePosition)
                    , strokeDasharray (toString lineLength ++ ",3000")
                    , strokeLinecap "round"
                    , d "m1.6e2 6.3e2c-.3-.065 1.8e2.022 1.8e2.061-2 .039-1.8e2.029-1.9e2-.23-.72-.52-2.8-2.1-3.4-2.4-5.2-2-9.3 6.3-12 .2-1.9-4.5 1.7-12 3.3-12 1.8.053-.46 5.3-2.3 8.1-2.1 4.1-9 9.6-12 3-1.2-5.3 1.4-15 7.1-15 5.7-.13 5.2 4.5 3 8.4-2.7 4.3-5.6 9.7-12 9.8-2.4-.21-4.8-.59-5.2-3.1-.32-4.4-.6-15-5.1-15-6.1-.073-8 2.8-9.1 7.8-.69 2.2-1.4 11 1.3 11 1.8-.13 1.6-23 1.6-35 .13-4.3-.024.73.081 3 .72 6.9.56 15-.92 22-.89 4.4-2.7 10-7.7 9.9-1.4-.038-2.1-.45-3.5-1.6-2.3-2.4-10-2.2-8.9.5 2.6 2.8 10-.36 11-5.4-.71-7.6-12-8.9-8.7-12 3.9-.006 2 4.5.1 9.1-2.5 4.7-2.6 9.2-8.9 9.3-6-.22-3.8-9.8-2-12 1.7-2.7 2.2-.86 2 1.4-.87 5.1-2.4 7.1-6.4 10-6.2 3.5-9.9-6.9-7.5-11 1.6-5.1 11-9.6 12-3.8-2.3 7.2-7.5 14-16 16-5.2.88-7.4-5.3-12-4.4-4.8 1.7-1 4.5 2.8 4.4 5.6-.064 8.7-7.5 5.3-12-1.6-2.9-7.4-5.6-3.7-6.9 3.9.69-2.2 7.3-5.1 10-4.3 4.4-12 2.7-16 7.2-6 10-6 2.1e2-3 2.6e2.63 14 32 14 44 2.7 7.5-7.8 23-25 13-27-9.4 3.3 5.4 10 9.6 18 8.7 10 .79 30-14 30-9.8.11-20-7-7.2-11 13-2.5 19 13 32 11 21-4.2 34-22 40-40-1.2-15-26-3.3-30 9.8-6.2 11 3.2 38 19 29 10-8.2 14-13 16-26 .31-5.8-.8-10-5.2-3.6-4.4 6.8-10 31 5.2 32 16-.18 17-12 23-24 4.8-12 9.7-24-.26-24-9.7 7.9 21 11 22 31-2.1 13-22 21-29 14-3.9-7 17-7.5 23-1.3 3.4 2.9 5.3 3.9 8.9 4 13 .28 17-14 20-25 3.8-18 4.2-38 2.4-56-.27-6 .12-19-.21-7.8.02 29 .39 88-4.1 89-6.9.48-5.2-22-3.4-27 2.9-13 7.6-20 23-20 12 .065 12 28 13 40 1 6.3 7.3 7.3 13 7.8 16-.36 23-14 31-25 5.6-10 6.8-22-7.7-22-15 .33-21 25-18 39 6.9 17 25 2.8 30-7.8 4.7-7.1 10-21 5.8-21-4.2.29-13 19-8.5 31 6.7 16 17-5.8 31-.52 3.1 1.5 7.4 5.7 11 6.4"
                    , fill "none"
                    ]
                    []
                ]
            ]
