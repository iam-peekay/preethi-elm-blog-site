module Update exposing (..)

import Navigation
import Http
import Models exposing (State, Post, Error)
import Routes.Routes exposing (..)
import Routes.Parsers exposing (decode, navigate)
import Messages exposing (Msg(..))
import Tasks exposing (..)


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            let
                newCmd =
                    navigate HomeRoute
            in
                ( state, newCmd )

        ShowPost postId ->
            let
                newCmd =
                    navigate (PostRoute postId)
            in
                ( state, newCmd )

        ShowAbout ->
            let
                newCmd =
                    navigate AboutRoute

                _ = 
                    Debug.log "Got here"
            in
                ( state, newCmd )

        ReceivePosts (Result.Ok posts) ->
            let
                newState =
                    { state | posts = Just posts, fetching = False }
            in
                ( newState, Cmd.none )

        ReceivePosts (Result.Err err) ->
            let _ =
                Debug.log "Error retrieving posts" err -- TODO: some real error handling
            in
                ( state, Cmd.none )

        ReceivePost (Result.Ok post) ->
            let
                newState =
                    { state | current = Just post, fetching = False }
            in
                ( newState, Cmd.none )
                
        ReceivePost (Result.Err err) ->      
            let _ =
                Debug.log "Error retrieving posts" err -- TODO: some real error handling
            in
                ( state, Cmd.none )

        UrlChange location ->              
            urlUpdate location state


urlUpdate : Navigation.Location -> State -> ( State, Cmd Msg )
urlUpdate location state =
    case (decode location) of
        HomeRoute ->
            let
                newState =
                    { state | posts = Nothing, route = HomeRoute, fetching = True }

                newCmd =
                    (fetchPosts ReceivePosts)
            in
                ( newState, newCmd )

        AboutRoute ->
            let
                newState =
                    { state | current = Nothing, route = AboutRoute }
            in
                ( newState, Cmd.none )

        PostRoute postId ->
            let
                newState =
                    { state | current = Nothing, route = (PostRoute postId), fetching = True }

                newCmd =
                    (fetchPost postId ReceivePost)
            in
                ( newState, newCmd )

        NotFound ->
            let
                error =
                    { code = "not_found", message = "Page not found" }

                newState =
                    { state | current = Nothing, posts = Nothing, route = NotFound, error = Just error }
            in
                ( newState, Cmd.none )
