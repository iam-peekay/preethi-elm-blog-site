module Update exposing (..)

import Navigation
import Http
import Models exposing (State, Post, Error)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))
import Tasks exposing (..)


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            let
                newCmd =
                    Navigation.newUrl (reverse HomeRoute)
            in
                ( state, newCmd )

        ShowPost postId ->
            let
                newCmd =
                    Navigation.newUrl (reverse (PostRoute postId))
            in
                ( state, newCmd )

        ShowAbout ->
            let
                newCmd =
                    Navigation.newUrl (reverse (AboutRoute))
            in
                ( state, newCmd )

        ReceivePosts posts ->
            let
                newState =
                    { state | posts = Just posts, fetching = False }
            in
                ( newState, Cmd.none )

        ReceivePost post ->
            let
                newState =
                    { state | current = Just post, fetching = False }
            in
                ( newState, Cmd.none )

        FetchFailed error ->
            case error of
                Http.BadResponse code message ->
                    let
                        error =
                            { code = toString code, message = message }

                        newState =
                            { state | fetching = False, error = Just error }
                    in
                        ( newState, Cmd.none )

                _ ->
                    let
                        error =
                            { code = "unknown_error", message = "Something bad happened" }

                        newState =
                            { state | fetching = False, error = Just error }
                    in
                        ( newState, Cmd.none )


urlUpdate : Route -> State -> ( State, Cmd Msg )
urlUpdate route state =
    case route of
        HomeRoute ->
            let
                newState =
                    { state | posts = Nothing, route = route, fetching = True }

                newCmd =
                    fetchPosts
            in
                ( newState, newCmd )

        AboutRoute ->
            let
                newState =
                    { state | current = Nothing, route = route }
            in
                ( newState, Cmd.none )

        PostRoute postId ->
            let
                newState =
                    { state | current = Nothing, route = route, fetching = True }

                newCmd =
                    fetchPost postId
            in
                ( newState, newCmd )

        NotFound ->
            let
                error =
                    { code = "not_found", message = "Page not found" }

                newState =
                    { state | current = Nothing, posts = Nothing, route = route, error = Just error }
            in
                ( newState, Cmd.none )
