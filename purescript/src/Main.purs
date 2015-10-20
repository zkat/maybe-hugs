module Main where

import MaybeHugs
import Control.Monad.Eff.Console
import Prelude

katie = huggable
john  = empathic

main = do
  log $ hug john
  log $ hug katie
