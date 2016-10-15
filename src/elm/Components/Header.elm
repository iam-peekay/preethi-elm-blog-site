module Components.Header exposing (component)

import Html exposing (..)
import Html.Attributes exposing (..)

-- Blog header
component : Html a
component =
  div [] [ h1 [ class "header" ] [ text ( "Preethi's Space") ] ]
