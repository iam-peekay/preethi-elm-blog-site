module Components.Header exposing (component)

import Html exposing (..)
import Html.Attributes exposing (..)

-- Hello component
component : Int -> Html a
component model =
  div [] [ h1 [ class "header" ] [ text ( "Preethi's Think Space") ] ]
