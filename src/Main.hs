{-# LANGUAGE NoImplicitPrelude #-}
module Main where

import           Protolude
import           Options.Applicative
import           System.Directory.ProjectRoot

main :: IO ()
main = execParser opts >>= runWithOptions
  where
    parser = StackFpmOptions <$> strOption
                               ( long "name"
                              <> metavar "NAME"
                              <> help "The name of the package to build" )
                             <*> switch
                               ( long "verbose"
                              <> help "Be verbose" )

data StackFpmOptions = StackFpmOptions { stackFpmName    :: Text
                                       , stackFpmVerbose :: Bool
                                       }
