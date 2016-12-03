module Components.Body exposing (component)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Components.Post.Content as PostContent
import Components.Post.List as PostsList
import Components.About as About
import Models exposing (State)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))


component : State -> Html Msg
component state =
    div [ class "body-container" ] [ bodyContent state ]


-- TODO: Add rest of routes
bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            PostsList.component state.posts

        PostRoute postId ->
            PostContent.component state.current
        
        AboutRoute ->
            About.component

        NotFound ->
            div [] [ text "NOT FOUND!!" ]

