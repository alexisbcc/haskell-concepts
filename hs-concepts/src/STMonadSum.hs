module STMonadSum
  ( sumST,
  )
where

import Control.Monad (forM_)
import Control.Monad.ST (runST)
import Data.STRef (modifySTRef, newSTRef, readSTRef)

sumST :: (Num a) => [a] -> a
sumST xs = runST $ do
  n <- newSTRef 0
  forM_ xs $ \x -> do
    modifySTRef n (+ x)
  readSTRef n
