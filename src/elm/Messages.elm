module Messages exposing (..)

import Models exposing (Post)
import Http


type alias PostId =
    Int


type Msg
    = ShowHome
    | ShowPost PostId
    | ShowAbout
    | ReceivePosts (List Post)
    | ReceivePost Post
    | FetchFailed Http.Error
