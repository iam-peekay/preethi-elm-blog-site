module Models exposing (..)

import Routes.Routes exposing(Route)

-- APP STATE
type alias State =
  { route : Route
  , fetching : Bool
  , posts : Maybe (List Post)
  , current : Maybe Post 
  }

-- SINGLE POST
type alias Post =
  { id : Int
  , author : String
  , title : String
  , body : String
  }

-- INIT NEW STATE
newState : Route -> Maybe Post -> State
newState route post =
  { route = route
  , fetching = False
  , posts = Nothing
  , current = post
  }
