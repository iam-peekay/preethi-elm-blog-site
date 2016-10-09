module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation
import String
import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)
import Models exposing(..)
import Routes.Routes exposing(..)
import Update exposing(..)

-- Component import
import Components.Header as MainHeader


init : Route -> (State, Cmd Msg)
init route =
  case route of
    _ ->
      ( newState route Nothing, Cmd.none )


-- APP
main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }


-- UPDATE


-- URL PARSERS

urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  case route of
    _ ->
      ({ state | route = route}, Cmd.none)

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
    ]


homeParser : Parser a a
homeParser =
  oneOf
    [ (UrlParser.s "index.html")
    , (UrlParser.s "")
    ]

-- SUBSCRIPTIONS

subscriptions : State -> Sub Msg
subscriptions state =
  Sub.none


-- VIEW
view : State -> Html a
view route =
  div [ class "container" ] [
    div [] [ MainHeader.component ]
  ]
