module Routes.Routes exposing (Route(..), reverse)


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostRoute PostId
    | AboutRoute
    | NotFound


reverse : Route -> String
reverse route =
    case route of
        PostRoute postId ->
            "/post/" ++ (toString postId)

        AboutRoute ->
            "/about"

        NotFound ->
            "/404"

        HomeRoute ->
            "/"
