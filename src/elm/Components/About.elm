module Components.About exposing (component)

import Html exposing (Html, h1, div, text, p, span)
import Html.Attributes exposing (class)
import Messages exposing (Msg)

component : Html Msg
component =
    div [ class "about-container" ]
        [ 
          h1 [ class "about-header" ] [ text ("About Me") ]
        , div [] [ (body) ]
        ]

body : Html Msg
body = 
  div [ class "about-body"] 
      [ p [] [ text ("Hi, I'm "), span [ class "highlight-word" ] [ text ("Preethi") ], text (" (Rhymes with leafy).") ]
      , p [] [ text ("I'm a ") , span [ class "highlight-word" ] [ text ("software engineer") ], text (" based in San Francisco.") ]
      , p [] [ span [ class "highlight-word" ] [ text ("Building") ], text (" useful "), span [ class "highlight-word" ] [ text ("software") ], text (" software products is what gets me out of bed in the morning — aside from morning workouts, almond butter and my space heater, of course.") ]
      , p [] [ span [ class "highlight-word" ] [ text ("Coding is my life") ], text (", although some of you know me from my former lives as a partner at Andreessen Horowitz, analyst at Goldman Sachs, and industrial engineering student at USC.") ]
      , p [] [ text ( "When I'm not immersed in "), span [ class "highlight-word" ] [ text ("JavaScript, React, Elm or Functional Programming") ], text(", you can find me giving back to the tech community through "), span [ class "highlight-word" ] [ text ("writing and teaching.") ] ]
      ]