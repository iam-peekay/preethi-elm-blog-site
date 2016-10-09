module Main exposing (..)

import Navigation
import Models exposing (..)
import View exposing (view)
import Routes.Routes exposing (..)
import Update exposing (..)
import Routes.Parsers exposing (urlParser)
import Messages exposing (Msg)

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


-- SUBSCRIPTIONS

subscriptions : State -> Sub Msg
subscriptions state =
  Sub.none