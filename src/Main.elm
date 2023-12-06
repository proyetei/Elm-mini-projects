module Main exposing (..)
import Browser
import Html exposing (div, text, input, button)
import Html.Attributes exposing (placeholder, style)
import Html.Events exposing (onClick, onInput)
import Svg exposing (Svg, circle, svg)
import Svg.Attributes exposing (cx, cy, fill, r)
import Svg.Attributes exposing (fill, stroke, strokeWidth)

import Svg.Attributes exposing (transform)

-- Define Color constants
brown : Svg.Attribute msg
brown =
    Svg.Attributes.fill "brown"

green : Svg.Attribute msg
green =
    Svg.Attributes.fill "green"

type Messages =
    Add
type BTree =
    Branch
        BTree -- left branch
        BTree -- right branch
    | Leaf -- end of a tree

aTree = Branch
         (Branch Leaf Leaf)
         (Branch (Branch Leaf Leaf) Leaf)

viewTree : BTree -> Svg msg
viewTree top =
    case top of
        Leaf ->
            circle [green] []

        Branch left right ->
            svg []
                [ circle [green] []
                , viewTree left
                , viewTree right
                ]
init =
    { inputText = "Search.." }

-- view is what we display
view model = 
    div [] [
        text "Hello World"
        , div [][]
        , input [ placeholder model.inputText ][]
        , button [ onClick Add ][ text "Submit" ]
        , viewTree aTree
    ] -- [list of attributes], [list of contents]

update msg model = 
    case msg of
        Add ->
            {model | inputText = "Submitted!"}
main =
    Browser.sandbox
    {
        init = init
        , view = view 
        , update = update
    }