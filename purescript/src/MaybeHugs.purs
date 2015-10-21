module MaybeHugs where

data MaybeHug s
  = Hug     s
  | Empathy s

empathic :: MaybeHug String
empathic = Empathy "Cutie prefers empathy! "

huggable :: MaybeHug String
huggable = Hug "HUG !"

hug :: forall s. MaybeHug s -> s
hug (Hug s) = s
hug (Empathy s) = s
