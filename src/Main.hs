{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import           Protolude

import           Control.Arrow
import qualified Data.List as List
import           Options.Applicative
import           System.Directory
import qualified System.FilePath as FilePath
import           System.Directory.ProjectRoot
import           Turtle                       hiding (switch, find)

import           Distribution.PackageDescription.Parse
import qualified Data.Yaml as Yaml

main :: IO ()
main = do
    opts <- execParser (info (helper <*> opts)
                             (fullDesc <>
                                  progDesc "Create a distribution package for a Haskell project" <>
                                  header "stack-fpm"))
    runWithOptions opts
  where
    opts = StackFpmOptions <$> (fmap toS <$> optional (strOption (long "name"
                                                       <> metavar "NAME"
                                                       <> help "The name of the package to build")))
                           <*> switch (long "verbose"
                                           <> help "Be verbose")

runWithOptions StackFpmOptions{..} = do
    name <- fromMaybe getName (return <$> stackFpmName)
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

getName = do
    cwd <- getCurrentDirectory
    fs <- getDirectoryContents cwd
    case List.find (== "package.yaml") fs of
        Just hpackManifest ->
            hpackGetName hpackManifest
        Nothing -> case List.find (FilePath.takeExtension >>> (== ".cabal")) fs of
            Just cabalManifest ->
                cabalGetName cabalManifest
            Nothing -> error "Can't get default name (no cabal/hpack manifest)"
  where
    cabalGetName fp = do
        f <- readFile fp
        case parseGenericPackageDescription f of
            Right (GenericPackageDescription{..}) -> undefined
            _ -> undefined
    hpackGetName = undefined

getVersion = undefined

tar = undefined

stackBuild = undefined

data StackFpmOptions = StackFpmOptions { stackFpmName    :: Maybe Text
                                       , stackFpmVerbose :: Bool
                                       }
  deriving(Show)
