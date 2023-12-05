module Main exposing (..)
import Browser
import Html exposing (div, text, input, button)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt)
import Debug exposing (log)

type Messages =
    Add

init =
    { inputText = "Search.." }

-- view is what we display
view model = 
    div [] [
        text "Hello World"
        , div [][]
        , input [ placeholder model.inputText ][]
        , button [ onClick Add ][ text "Submit" ]
    ] -- [list of attributes], [list of contents]

update msg model = 
    case msg of
        Add ->
            model
main =
    Browser.sandbox
    {
        init = init
        , view = view 
        , update = update
    }