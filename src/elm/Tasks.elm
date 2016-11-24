module Tasks exposing (..)

import Models exposing (Post)
import Decoders.Posts exposing (..)
import Http


apiHost : String
apiHost =
    "http://localhost:3000"


fetchPosts : (Result Http.Error (List Post) -> msg) -> Cmd msg
fetchPosts msg =
    let
        url =
            apiHost ++ "/api/posts"
    in
        Http.get url decodePosts |> Http.send msg


fetchPost : Int -> (Result Http.Error Post -> msg) -> Cmd msg
fetchPost postId msg =
    let
        url =
            apiHost ++ "/api/posts/" ++ (toString postId)
    in
        Http.get url decodePost |> Http.send msg
