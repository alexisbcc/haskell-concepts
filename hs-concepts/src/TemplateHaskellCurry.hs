module TemplateHaskellCurry where

import Control.Monad (replicateM)
import Control.Monad.ST (runST)
import Language.Haskell.TH
  ( Exp (AppE, LamE, TupE, VarE),
    Pat (VarP),
    Q,
    Quote (newName),
  )

curryN :: Int -> Q Exp
curryN n = do
  f <- newName "f"
  xs <- replicateM n (newName "x")
  let args = map VarP (f : xs)
      ntup = TupE (map VarE xs)
  return $ LamE args (AppE (VarE f) ntup)
