module Components.About exposing (component)

import Html exposing (Html, h1, div, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)

component : Html Msg
component =
    div [ class "about-container" ]
        [ 
          h1 [ class "about-header" ] [ text ("About Me") ]
        , div [ class "about-body" ] [ text "My name is Preethi" ]
        ]
