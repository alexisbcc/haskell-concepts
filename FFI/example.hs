{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Prelude hiding (sin)
import Foreign.C -- get the C types
import Foreign.Ptr (Ptr,nullPtr)

foreign import ccall "sin" 
  c_sin :: CDouble -> CDouble

sin :: Double -> Double
sin d = realToFrac (c_sin (realToFrac d))

foreign import ccall "time" 
  c_time :: Ptr a -> IO CTime

getTime :: IO CTime
getTime = c_time nullPtr

main :: IO ()
main = do
  print . sin =<< readLn
  print =<< getTime
