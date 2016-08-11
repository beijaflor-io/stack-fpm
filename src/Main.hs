{-# LANGUAGE NoImplicitPrelude #-}
module Main where

import           Protolude
import           Options.Applicative

data StackFpmOptions = StackFpmOptions { stackFpmName :: Text
                                       }

main :: IO ()
main = putStrLn "Hello, Haskell!"
