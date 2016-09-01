{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Text.Printf
import Data.List
import Data.Char

import Printer

letters :: [String]
letters =
  [ "A"
  , "B"
  , "C"
  , "D"
  , "E"
  , "F"
  , "G"
  ]

_args :: [String] -> [String]
_args =
  fmap argify
  where
    lc xs = [toLower x | x <- xs]
    argify x = lc x ++ ": Observable<" ++ x ++ ">"

_args2 :: [String] -> [String]
_args2 =
  fmap argify
  where
    lc xs = [toLower x | x <- xs]
    argify x = lc x ++ ": " ++ x

printType :: Printer
printType xs =
  printf
    "static forkJoin<%s>(\n%s\n): Observable<[%s]>;"
    params
    args
    result
  where
    params :: String = intercalate ", " xs
    args :: String = intercalate ",\n" $ _args xs
    result :: String = intercalate ", " xs

main :: IO ()
main =
  printTypes printType
  where
    printTypes printer = mapM_ putStrLn $ reverse $ loop printer letters
