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
        { state | posts = Just posts, loading = False }
      in 
        (newState, Cmd.none)
    _ ->
      let newCmd =
         Navigation.newUrl (reverse HomeRoute)
      in 
        (state, newCmd)


urlUpdate : Route -> State -> (State, Cmd Msg)
urlUpdate route state =
  case route of
    _ ->
      ({ state | route = route}, Cmd.none)

  -- = ShowHome
  -- | ShowPost PostId
  -- | ReceivePosts (List Post)
  -- | ReceivePost Post
  -- | FetchFailed Http.Error