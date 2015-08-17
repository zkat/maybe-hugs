module MaybeHugs where

import Array exposing (Array, fromList, get, length)
import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (drop, map)
import Maybe exposing (withDefault)
import Random
import Random exposing (Seed, Generator)
import Signal exposing (Signal, (<~), (~), foldp)
import Time exposing (every, second)

import Cutie exposing (..)

names : Array String
names = fromList [
    "Treena"
  , "Roger"
  , "Patsy"
  , "Tesha"
  , "Madie"
  , "Wendie"
  , "Kendra"
  , "Hedy"
  , "Milan"
  , "Debbra"
  , "Al"
  , "Rosita"
  , "Sharleen"
  , "Lekisha"
  , "Reina"
  , "Voncile"
  , "Amie"
  , "Ashlea"
  , "Rosetta"
  , "Brynn"
  ]

random generator max seed = seed |> (Random.generate <| generator 0 max) |> fst

randomFloat : Seed -> Float
randomFloat seed = random Random.float 1 seed

randomNameIdx : Seed -> Int
randomNameIdx seed =
  let n = (length names) - 1
  in random Random.int n seed

randomName : Seed -> String
randomName seed = randomNameIdx seed |> (\idx -> get idx names |> withDefault "?")

randomBool : Seed -> Bool
randomBool seed = randomFloat seed |> (\f -> if f > 0.5 then True else False)

randomCutie : Seed -> Cutie
randomCutie seed = cutie (randomName seed) (randomBool seed)

timedSeedSignal : Signal Seed
timedSeedSignal = Random.initialSeed << round <~ every second

cutieSignal : Signal Cutie
cutieSignal = randomCutie <~ timedSeedSignal

update : Cutie -> List Cutie -> List Cutie
update newCutie cuties =
  let cuties' = cuties ++ [newCutie]
  in if (List.length cuties') > 5 then drop 1 cuties' else cuties'

cutiesSignal : Signal (List Cutie)
cutiesSignal = foldp update [] cutieSignal

cutieView : Cutie -> Html
cutieView cutie = p [class "cutie"] [text <| maybeHug cutie]

main : Signal Html
main =
  (\ cuties ->
    section
    [ id "maybehugapp" ]
    [ h1 [] [ text "Maybe Hugs" ]
    , h2 [] [ text "in Elm" ]
    , div [] (map cutieView cuties)
    ]
  ) <~ cutiesSignal
