module Main where

import qualified MaybeHug

-- any type can be an instance of Huggable
instance MaybeHug.Huggable Int where
  wantsHug n = True

-- a Cutie
data Cutie = Cutie { name :: String, wantsHug :: Bool }

-- let's make Cutie Huggable
instance MaybeHug.Huggable Cutie where
  wantsHug = wantsHug

main :: IO ()
main = do
  -- hug an Int
  putStrLn $ MaybeHug.maybeHug (3::Int)
  -- hug a cutie
  putStrLn $ MaybeHug.maybeHug $ Cutie { name = "Brad", wantsHug = True }
  -- this cutie doesn't want hugs
  putStrLn $ MaybeHug.maybeHug $ Cutie { name = "Jen", wantsHug = False }
