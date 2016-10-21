module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing(State)
import Messages exposing (Msg)
import Components.Header as MainHeader
import Components.Body as Body

view : State -> Html Msg
view state =
  div [ class "container" ] 
    [ div [] [ MainHeader.component ]
    , div [] [ Body.component state ]
  ]
