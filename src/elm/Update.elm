module Update exposing (..)

import Navigation
import Models exposing (State, Post)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))

update :  Msg -> State -> (State, Cmd Msg)
update msg state =
  case msg of
    ShowHome ->
      let newCmd = 
        Navigation.newUrl (reverse HomeRoute)
      in
        (state, newCmd)
    ShowPost postId ->
      let newCmd =
        Navigation.newUrl (reverse (PostRoute postId))
      in 
        (state, newCmd)
    ReceivePosts posts ->
      let newState =
        { state | posts = Just posts, fetching = False }
      in 
        (newState, Cmd.none)
    ReceivePost post ->
      let newState =
        { state | current = Just post, fetching = False }
      in 
        (newState, Cmd.none)
    FetchFailed error ->
      let error = { id = error.id, message = error.message }
          newState = { state | error = Just error }
      in 
        (newState, Cmd.none)


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  case route of
    _ ->
      ({ state | route = route}, Cmd.none)
