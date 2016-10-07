module Common.Html exposing (linkAttributes) 


import Common.Events exposing (onClick)
import Html exposing (Attribute)
import Html.Attributes exposing (class, href)


type alias Url =
  String

type alias ClassName = 
  String


linkAttributes : ClassName -> msg -> Url -> List (Attribute msg)
linkAttributes className message path =
  [ onClick message
  , href path
  , class className
  ]
