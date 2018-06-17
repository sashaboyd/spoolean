module Filters exposing (dropShadow)

import Html.Styled exposing (Html)
import Svg.Styled
    exposing
        ( Svg
        , filter
        , feGaussianBlur
        , feOffset
        , feComponentTransfer
        , feFuncA
        , feMerge
        , feMergeNode
        )
import Svg.Styled.Attributes
    exposing
        ( height
        , width
        , fill
        , in_
        , id
        , slope
        , type_
        , stdDeviation
        , dx
        , dy
        , result
        )


dropShadow : String -> Float -> Int -> Int -> Svg msg
dropShadow id_ blur offsetX offsetY =
    filter
        [ id "dropshadow"
        , height "130%"
        ]
        [ feGaussianBlur
            [ in_ "SourceAlpha"
            , stdDeviation (toString blur)
            ]
            []
        , feOffset
            [ dx (toString offsetX)
            , dy (toString offsetY)
            , result "offsetblur"
            ]
            []
        , feComponentTransfer []
            [ feFuncA
                [ type_ "linear"
                , slope "0.5"
                ]
                []
            ]
        , feMerge []
            [ feMergeNode [] []
            , feMergeNode
                [ in_ "SourceGraphic"
                ]
                []
            ]
        ]
