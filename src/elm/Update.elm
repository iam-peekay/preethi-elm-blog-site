module Update exposing (..)

import Models exposing(State, Post)

type Msg = String

update : Msg -> State -> (State, Cmd Msg)
update msg state =
  let newState = state
  in
    (newState, Cmd.none)