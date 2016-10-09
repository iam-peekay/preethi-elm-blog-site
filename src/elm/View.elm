module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing(State)
import Components.Header as MainHeader

view : State -> Html a
view state =
  div [ class "container" ] [
    div [] [ MainHeader.component ]
  ]
