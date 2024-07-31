# Foreing Function Interface

This haskell package allows binding functions from other programming languages t be called inside haskell code and viceversa.

In order to call a C functrion we first need to import the external function using the foreing module and then bind the equivalent types from C.

The first step is to call he Language Extension

```haskell
{-# LANGUAGE ForeignFunctionInterface #-}
```

Import foreing modules

```haskell
import Foreign
import Foreign.C.Types
```

For this example we are using the math C library

```haskell
foreign import ccall "math.h sin"
     c_sin :: CDouble -> CDouble
```

## Example

`hs-concepts`

[ForeignFunctionC](../hs-concepts/src/ForeignFunctionC.hs)
