module Components.Post.List exposing (component)

import Html exposing (Html, Attribute, h2, ul, li, div, text, a, header)
import Html.Attributes exposing (class, href)
import Common.Html exposing (linkAttributes)
import Models exposing (Post)
import Routes.Routes exposing (..)
import Messages exposing (Msg(..))

component : Maybe (List Post) -> Html Msg 
component posts =
  case posts of
    Just posts ->
      postList posts
    Nothing -> 
      div [ class "empty-posts"  ] [ text "No posts yet. Check back later!" ]


postList : (List Post) -> Html Msg 
postList posts =
  ul [ class "posts-list" ] (List.map postListItem posts)


postListItem : Post -> Html Msg
postListItem post =
  li [ class "post-item" ]
     [ a (postLinkAttributes (ShowPost post.id) (reverse (PostRoute post.id)))
      [ div [ class "post-item-title" ] [ text post.title ] ]
     ]

postLinkAttributes : Msg -> String -> List (Attribute Msg)
postLinkAttributes =
  linkAttributes "post-item-url"
