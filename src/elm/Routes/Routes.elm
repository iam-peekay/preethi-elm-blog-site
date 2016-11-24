module Routes.Routes exposing (Route(..))


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostRoute PostId
    | AboutRoute
    | NotFound
