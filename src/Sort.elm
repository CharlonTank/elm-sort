module Sort exposing (bubbleSort, mergeSort, quickSort)

import List.Extra exposing (splitAt)



-- Merge Sort -- Stable -- Average : O(n*log(n)) -- Worst : O(n*log n) --


mergeSort : List comparable -> List comparable
mergeSort list =
    case splitInHalf list of
        ( [], [] ) ->
            []

        ( [], [ a ] ) ->
            [ a ]

        ( left, right ) ->
            merge (mergeSort left) (mergeSort right)


merge : List comparable -> List comparable -> List comparable
merge left right =
    case ( left, right ) of
        ( e :: l, f :: r ) ->
            if e < f then
                e :: merge l right

            else
                f :: merge left r

        ( [], [] ) ->
            []

        ( [], r ) ->
            r

        ( l, [] ) ->
            l


splitInHalf : List a -> ( List a, List a )
splitInHalf list =
    splitAt (List.length list // 2) list



-- Quick Sort -- Unstable -- Average : O(n*log(n)) -- Worst : O(n^2) --


quickSort : List comparable -> List comparable
quickSort list =
    case list of
        e :: l ->
            quickSort (List.filter ((>=) e) l) ++ (e :: quickSort (List.filter ((<) e) l))

        [] ->
            []



-- Bubble Sort -- Stable -- Average : O(n^2) -- Worst : O(n^2) --


bubbleSort : List comparable -> List comparable
bubbleSort list =
    let
        newList =
            List.foldr order [] list
    in
    if isSorted newList then
        newList

    else
        bubbleSort newList


isSorted : List comparable -> Bool
isSorted list =
    case list of
        e :: g :: l ->
            if e <= g then
                isSorted (g :: l)

            else
                False

        _ ->
            True


order : comparable -> List comparable -> List comparable
order nb list =
    case list of
        e :: l ->
            if nb <= e then
                List.append [ nb, e ] l

            else
                List.append [ e, nb ] l

        [] ->
            [ nb ]
