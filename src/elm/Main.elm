module Main exposing (..)

import Navigation
import Models exposing (..)
import View exposing (view)
import Update exposing (..)
import Tasks exposing (..)
import Messages exposing (Msg(..))
import Routes.Routes exposing (..)


-- TODO: Add rest of routes


-- init : Route -> ( State, Cmd Msg )
-- init route =
--     case route of
--         HomeRoute ->
--             ( newState route Nothing, fetchPosts )

--         AboutRoute ->
--             ( newState route Nothing, Cmd.none )

--         PostRoute postId ->
--             ( newState route Nothing, fetchPost postId )

--         _ ->
--             ( newState route Nothing, Cmd.none )

init : Navigation.Location -> ( State, Cmd Msg )
init location =
    update (UrlChange location) initialState

-- APP


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : State -> Sub Msg
subscriptions state =
    Sub.none
