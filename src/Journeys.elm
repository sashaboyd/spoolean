module Journeys exposing (Journey (..), label, path, link)

import UrlParser exposing ((</>), s, top)

type Journey
    = Home
    | About
    | Personal (Maybe String)
    | Engineering (Maybe String)


label : Journey -> String
label journey =
    case journey of
        Home ->
            "home"

        About ->
            "about"

        Personal Nothing ->
            "dialogs"

        Personal (Just name) ->
            "dialog about " ++ name

        Engineering _ ->
            "dev"


path : Journey -> UrlParser.Parser a a
path journey =
    case journey of
        Home ->
            top

        About ->
            s "about"

        Personal Nothing ->
            s "musings"

        Personal (Just name) ->
            s "musings" </> s name

        Engineering Nothing ->
            s "engineering"

        Engineering (Just name) ->
            s "engineering" </> s name


link : Journey -> String
link journey =
    case journey of
        Home ->
            "/"

        About ->
            "/about"

        Personal Nothing ->
            "/musings"

        Personal (Just name) ->
            "/musings/" ++ name

        Engineering Nothing ->
            "/engineering"

        Engineering (Just name) ->
            "/engineering/" ++ name
