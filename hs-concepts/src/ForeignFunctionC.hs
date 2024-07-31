{-# LANGUAGE ForeignFunctionInterface #-}

module ForeignFunctionC where

import Foreign.C (CDouble (..), CTime (..))
import Foreign.Ptr (Ptr, nullPtr)
import Prelude hiding (sin)

foreign import ccall "sin"
  c_sin :: CDouble -> CDouble

sin :: Double -> Double
sin d = realToFrac (c_sin (realToFrac d))

foreign import ccall "time"
  c_time :: Ptr a -> IO CTime

getTime :: IO CTime
getTime = c_time nullPtr
