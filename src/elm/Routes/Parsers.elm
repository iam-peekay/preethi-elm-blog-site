module Routes.Parsers exposing (urlParser, parse)

import Navigation
import String
import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)
import Routes.Routes exposing (..)

urlParser : Navigation.Parser Route
urlParser =
  Navigation.makeParser parse

parse : Navigation.Location -> Route
parse {pathname} =
  let
    path =
      if String.startsWith "/" pathname then
        String.dropLeft 1 pathname
      else
        pathname

    result =
      UrlParser.parse identity routeParser path

  in
    case result of
      Err err -> NotFound

      Ok route -> route

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ format HomeRoute homeParser
    , format PostRoute postParser
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
