module Components.Header exposing (component)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Events exposing (onClick)
import Common.Html exposing (linkAttributes)
import Routes.Routes exposing (..)
import Messages exposing(Msg(..))


-- Parent header component
component : Html Msg
component =
  div [] [ h1 [ class "header" ] [ text ( "Preethi's Space") ]
         , div [] [ navBar ]
         ]

-- Navbar child component
navBar : Html Msg 
navBar = 
  let homePath =
        reverse HomeRoute

      aboutPath = 
        reverse AboutRoute
  in
    nav [ class "header-nav" ]
      [ a (headerLinkAttributes ShowHome homePath) [ text "Home" ]
      , a (headerLinkAttributes ShowAbout aboutPath) [ text "About" ]
      ]

-- Grand child component
headerLinkAttributes : Msg -> String -> List (Attribute Msg)
headerLinkAttributes = 
  linkAttributes "navbar-link"
