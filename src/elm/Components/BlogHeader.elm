module Components.BlogHeader exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- Hello component
blogHeader : Int -> Html a
blogHeader model =
  div [] [ h1 [ class "header" ] [ text ( "Preethi's Blog") ] ]
