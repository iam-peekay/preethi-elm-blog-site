module Main exposing (..)

import Navigation
import Models exposing (..)
import View exposing (view)
import Update exposing (..)
import Messages exposing (Msg(..))

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
