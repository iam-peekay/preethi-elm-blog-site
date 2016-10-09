module Components.Header exposing (component)

import Html exposing (..)
import Html.Attributes exposing (..)

-- Hello component
component : Html a
component =
  div [] [ h1 [ class "header" ] [ text ( "Preethi's Think Space") ] ]
