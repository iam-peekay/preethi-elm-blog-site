module Components.Header exposing (component)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Html exposing (linkAttributes)
import Routes.Parsers exposing (encode)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))


-- Parent header component


component : Html Msg
component =
    div [ class "header-container" ]
        [ h1 [ class "header" ] [ text ("Preethi's Space") ]
        , div [] [ navBar ]
        ]



-- Navbar child component


navBar : Html Msg
navBar =
    let
        homePath =
            encode HomeRoute

        aboutPath =
            encode AboutRoute
    in
        div []
            [ a (headerLinkAttributes ShowHome homePath) [ text "Home" ]
            , a (headerLinkAttributes ShowAbout aboutPath) [ text "About" ]
            ]



-- Grand child component


headerLinkAttributes : Msg -> String -> List (Attribute Msg)
headerLinkAttributes =
    linkAttributes "navbar-link"
