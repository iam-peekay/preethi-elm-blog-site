module Components.Body exposing (component)

import Html exposing (Html, Attribute, h2, ul, li, div, text, a, p, header)
import Html.Attributes exposing (class, href)
import Components.Post.Content as PostContent
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
      postsListComponent state.posts
    PostRoute postId ->
      PostContent.component state.current
    _ -> 
      div [] [ text "This is the default route!!" ]


postsListComponent : Maybe (List Post) -> Html Msg 
postsListComponent posts =
  case posts of
    Just posts ->
      postList posts
    Nothing -> 
      div [ class "empty-posts"  ] [ text "No posts yet. Check back later!" ]


postList : (List Post) -> Html Msg 
postList posts =
  ul [ class "posts-list" ] (List.map postItem posts)


postItem : Post -> Html Msg
postItem post =
  li [ class "post-item" ]
     [ a (postLinkAttributes (ShowPost post.id) (reverse (PostRoute post.id)))
      [ h2 [ class "post-title" ] [ text post.title ] ]
     ]

postLinkAttributes : Msg -> String -> List (Attribute Msg)
postLinkAttributes =
  linkAttributes "post-url"
