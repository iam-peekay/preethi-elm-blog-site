module Tasks exposing (..)

import Messages exposing (..)
import Decoders.Posts exposing (..)
import Http
import Task 

apiHost : String
apiHost = "http://localhost:3000"

fetchPosts : Cmd Msg 
fetchPosts = 
  let 
    url = apiHost ++ "/api/posts333"
  in 
    Task.perform FetchFailed ReceivePosts (Http.get decodePosts url)


fetchPost : Int -> Cmd Msg 
fetchPost postId =
  let 
    url = apiHost ++ "/api/post/" ++ (toString postId)
  in 
    Task.perform FetchFailed ReceivePost (Http.get decodePost url)
