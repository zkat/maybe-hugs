-- Compile with `idris hug.idr -o hug`
-- Run like `./hug`
module Main

data You = Noon

instance Show You where
  show Noon = "Noon"

class Cutie a where
  wantsHug : a -> You -> Bool

instance Cutie String where
  -- Sally loves hugging
  wantsHug "Sally" _ = True
  -- Kelly will only hug Noon
  wantsHug "Kelly" Noon = True
  -- Noon won't hug anyone else (note that Sally will still hug Noon.)
  wantsHug _ Noon = False
  -- No other hug implementations.
  wantsHug _ _  = False


empathiseWith : (Cutie a, Show a) => You -> a -> IO ()
empathiseWith you cutie = do
  if (wantsHug cutie you) then
                         putStrLn $ (show you) ++ " hugs " ++ (show cutie) ++ "!"
                         else
                         putStrLn $ (show you) ++ " empathise with " ++ (show
                                    cutie) ++ " without hugging!"


main : IO ()
main = do
  empathiseWith Noon "Sally"
