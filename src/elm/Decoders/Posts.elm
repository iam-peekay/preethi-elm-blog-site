module Decoders.Posts exposing (..)

import Json.Decode exposing (Decoder, list, int, string, map4, at, field)
import Models exposing (Post)


decodePost : Decoder Post
decodePost =
    map4 Post
        (field "id" int)
        (field "author" string)
        (field "title" string)
        (field "body" string)


decodePosts : Decoder (List Post)
decodePosts =
    list decodePost
