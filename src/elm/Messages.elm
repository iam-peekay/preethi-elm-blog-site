module Messages exposing (..)

import Models exposing (Post)
import Navigation
import Http


type alias PostId =
    Int


type Msg
    = ShowHome
    | ShowPost PostId
    | ShowAbout
    | ReceivePosts (Result Http.Error (List Post))
    | ReceivePost (Result Http.Error Post)
    | UrlChange Navigation.Location
