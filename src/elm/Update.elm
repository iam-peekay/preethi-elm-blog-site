module Update exposing (..)

import Models exposing(State, Post)
import Routes.Routes exposing(Route)
import Messages exposing (Msg)

update : Msg -> State -> (State, Cmd Msg)
update msg state =
  let newState = state
  in
    (newState, Cmd.none)


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  case route of
    _ ->
      ({ state | route = route}, Cmd.none)