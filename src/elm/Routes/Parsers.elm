module Routes.Parsers exposing (..)

import Navigation
import UrlParser exposing (Parser, (</>), map, int, oneOf, s, string, parsePath)
import Routes.Routes exposing (..)


decode : Navigation.Location -> Route
decode location =
    let
        result =
            parsePath routeParser location
    in
        case result of
            Nothing ->
                NotFound

            Just route ->
                route


encode : Route -> String
encode route =
    case route of
        PostRoute postId ->
            "/post/" ++ (toString postId)

        AboutRoute ->
            "/about"

        NotFound ->
            "/404"

        HomeRoute ->
            "/"


navigate : Route -> Cmd msg
navigate route = 
    Navigation.newUrl (encode route)


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map PostRoute postParser
        , map HomeRoute homeParser
        ]


homeParser : Parser a a
homeParser =
    oneOf
        [ (UrlParser.s "index.html")
        , (UrlParser.s "")
        ]


postParser : Parser (Int -> a) a
postParser =
    s "post" </> int
