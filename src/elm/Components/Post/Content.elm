module Components.Post.Content exposing (component)

import Models exposing (Post)
import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)

component : Maybe Post -> Html Msg
component post = 
  case post of
    Just post ->
      div [ class "post-container" ]
        [ h2 [ class "post-header" ] [ text post.title ] 
        , div [ class "post-author" ] [ text post.author ]
        , div [ class "post-body" ] [ text post.body ]
        ]
    Nothing ->
      div [] [ text "Loading..." ]
