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
    HomeRoute ->
      let 
        newState = 
          { state | posts = Nothing, route = route, fetching = True }
        newCmd =
          -- fetchPosts TODO
          Cmd.none
      in
        (newState, newCmd)
    About ->
      let 
        newState = 
          { state | current = Nothing, route = route }
      in
        (newState, Cmd.none)
    PostRoute postId ->
      let 
        newState = 
          { state | current = Nothing, route = route, fetching = True }
        newCmd =
          -- fetchPost postId TODO
          Cmd.none
      in
        (newState, newCmd)
    NotFound ->
      let
        error = 
          { id = "not_found", message = "Page not found" }
        newState = 
          { state | current = Nothing, posts = Nothing, route = route, error = Just error }
      in
        (newState, Cmd.none)
    _ ->
      ({ state | route = route}, Cmd.none)
