module Decoders.Posts exposing (..)

import Json.Decode exposing (Decoder, object4, list, int, string, (:=))
import Models exposing (Post)

decodePost : Decoder Post
decodePost =
  object4 Post
    ("id" := int)
    ("author" := string)
    ("title" := string)
    ("body" := string)

decodePosts : Decoder (List Post)
decodePosts = 
  list decodePost
  