module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Sort



-- Model --


type alias Model =
    List Int


initialModel : Model
initialModel =
    [ 4, 3, 2, 1, 4, 3, 2, 1, -9000, 200, -56, -9001, 800888, -40000 ]



-- Update --


type Msg
    = BubbleSort
    | QuickSort
    | MergeSort


update : Msg -> Model -> Model
update msg =
    case msg of
        BubbleSort ->
            Sort.bubbleSort

        QuickSort ->
            Sort.quickSort

        MergeSort ->
            Sort.mergeSort



-- View --


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick BubbleSort ] [ text "Bubble Sort" ]
        , button [ onClick QuickSort ] [ text "Quick Sort" ]
        , button [ onClick MergeSort ] [ text "Merge Sort" ]
        , div [] (List.map showNb model)
        ]


showNb : Int -> Html Msg
showNb nb =
    div [] [ text <| String.fromInt nb ]



-- Functions --
-- Main --


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
