{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Protolude

import           Options.Applicative
import           System.Directory.ProjectRoot
import           Turtle                       hiding (switch)

main :: IO ()
main = do
    opts <- execParser (info (helper <*> opts)
                             (fullDesc <>
                                  progDesc "Create a distribution package for a Haskell project" <>
                                  header "stack-fpm"))
    runWithOptions opts
  where
    opts = StackFpmOptions <$> (toS <$> strOption (long "name"
                                                       <> metavar "NAME"
                                                       <> help "The name of the package to build"))
                           <*> switch (long "verbose"
                                           <> help "Be verbose")

runWithOptions _ = do
    echo "Hello"
    Turtle.stdout (inshell "stack docker pull" empty)
    Turtle.stdout (inshell "stack build --docker" empty)

defaultName = undefined
buildForLinux = undefined
buildForDarwin = undefined
runFpm = undefined

type FpmTargetType = Text

type FpmSourceType = Text

data FpmOptions = FpmOptions { fpmTarget        :: FpmTargetType
                             , fpmSource        :: FpmSourceType
                             , fpmDebPreDepends :: [Text]
                             , fpmName          :: Text
                             , fpmVersion       :: Text
                             , fpmInput         :: Turtle.FilePath
                             }

getVersion = undefined

tar = undefined

stackBuild = undefined

data StackFpmOptions = StackFpmOptions { stackFpmName    :: Text
                                       , stackFpmVerbose :: Bool
                                       }
  deriving(Show)
