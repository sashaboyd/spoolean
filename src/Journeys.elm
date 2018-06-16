module Journeys
    exposing
        ( Journey(..)
        , Msg(..)
        , update
        , label
        , path
        , link
        , entryLink
        )

import UrlParser exposing ((</>), s, top)
import Html exposing (Html, a, text)
import Html.Attributes exposing (href)
import Html.Events exposing (onWithOptions, defaultOptions)
import Json.Decode as Json
import Navigation


type Journey
    = Home
    | About
    | Personal
    | Engineering


type Msg
    = Start Journey


{-| A single step (usually a page) in a user journey
-}
type alias Step =
    ( Journey, Maybe String )


update : Msg -> model -> ( model, Cmd Msg )
update msg model =
    case msg of
        Start journey ->
            ( model
            , Navigation.newUrl (link journey)
            )


label : Journey -> String
label journey =
    case journey of
        Home ->
            "home"

        About ->
            "about"

        Personal ->
            "dialogs"

        Engineering ->
            "dev"


{-| Get the path associated with a step
-}
path : Journey -> UrlParser.Parser a a
path journey =
    case journey of
        Home ->
            top

        About ->
            s "about"

        Personal ->
            s "musings"

        Engineering ->
            s "engineering"


link : Journey -> String
link journey =
    case journey of
        Home ->
            "/"

        About ->
            "/about"

        Personal ->
            "/musings"

        Engineering ->
            "/engineering"


entry : Journey -> List (Html Msg) -> Html Msg
entry journey =
    a
        [ href (link journey)
        , onWithOptions "click"
            { defaultOptions | preventDefault = True }
            (Json.succeed (Start journey))
        ]


entryLink : Journey -> Html Msg
entryLink journey =
    entry journey [ text (label journey) ]
