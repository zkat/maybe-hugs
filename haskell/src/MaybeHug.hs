module MaybeHug
    ( Huggable,
      maybeHug,
      wantsHug
    ) where

class Huggable a where
  wantsHug :: a -> Bool

maybeHug :: (Huggable a) => a -> String
maybeHug h =
  if wantsHug h
    then "Hug!"
    else "Empathy!"
