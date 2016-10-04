import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)

-- Component import
import Components.BlogHeader exposing (blogHeader)


-- APP
main : Program Never
main =
  Html.beginnerProgram 
  { model = model
  , view = view
  , update = update 
  }


-- MODEL
type alias Model = Int

model : number
model = 0


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


-- VIEW
view : Model -> Html Msg
view model =
  div [ class "container" ] [
    div [] [ blogHeader model ]
  ]

-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
