module Components.About exposing (component)

import Html exposing (Html, h1, div, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)

component : Html Msg
component =
    div [ class "aboutme-container" ]
        [ h1 [ class "header" ] [ text ("About Me") ]
        ]
