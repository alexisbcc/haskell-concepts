module Main (main) where

import STMonadSum
import ForeignFunction
import TemplateHaskellCurry

main :: IO ()
main = do
  -- ST Monad example
  print $ sumST [1,2,3,4,5,6,7,8,9]

  -- FFI example
  print . sin =<< readLn
  print =<< getTime