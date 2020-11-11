module Main exposing (..)

import Browser
import Html exposing (Html, div, input, ul, li, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
main =
    Browser.sandbox { init = init, update = update, view = view }

type alias Model = 
    { content: String,
      todos : List String
    }

init : Model
init = 
    { content = "",
      todos = []
    }

type Msg = Add | Change String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }
        Add ->
            { todos = model.content::model.todos, content = "" }

view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Add Todo", value model.content, onInput Change ] []
        , button [ onClick Add ] [ text "+"]
        , ul [] (List.map (\l -> li [] [ text l ]) model.todos)
        ]