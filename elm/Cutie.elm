module Cutie (Cutie, cutie, maybeHug, wantsHug) where

type alias Cutie =
    { name : String
    , acceptsHugs : Bool
    }

cutie : String -> Bool -> Cutie
cutie name acceptsHugs = { name = name, acceptsHugs = acceptsHugs }

wantsHug : Cutie -> Bool
wantsHug cutie = cutie.acceptsHugs

maybeHug : Cutie -> String
maybeHug cutie = cutie.name ++
    if wantsHug cutie then " would like a hug!" else " prefers empathy."
