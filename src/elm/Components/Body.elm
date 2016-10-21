module Components.Body exposing (component)

import Html exposing (Html, Attribute, h2, ul, li, div, text, a, p, header)
import Html.Attributes exposing (class, href)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))
import Models exposing (State, Post)
import Common.Html exposing (linkAttributes)

component : State -> Html Msg
component state =
  div [ class "body-container" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state = 
  case state.route of
    HomeRoute -> 
      div [] [ text "This is where posts will go!!" ]
    _ -> 
      div [] [ text "This is the default route!!" ]
      

postLinkAttributes : Msg -> String -> List (Attribute Msg)
postLinkAttributes =
  linkAttributes "post-url"
