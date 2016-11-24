module Models exposing (..)

import Routes.Routes exposing (Route)
import Routes.Routes exposing(..)

type alias Error =
    { code : String
    , message : String
    }



-- APP STATE


type alias State =
    { route : Route
    , fetching : Bool
    , error : Maybe Error
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



-- INIT STATE


initialState : State
initialState =
    { route = HomeRoute
    , fetching = False
    , posts = Nothing
    , error = Nothing
    , current = Nothing
    }
