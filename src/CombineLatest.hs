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
    "static combineLatest<%s>(\n%s\n): Observable<[%s]>;"
    params
    args
    result
  where
    params :: String = intercalate ", " xs
    args :: String = intercalate ",\n" $ _args xs
    result :: String = intercalate ", " xs

printType2 :: Printer
printType2 xs =
  if null $ tail xs
  then mempty
  else
    printf
      "static combineLatest<%s>(\n%s,\nresultSelector: (%s) => %s\n): Observable<%s>;"
      params
      args
      selectorArgs
      result
      result
  where
    params :: String = intercalate ", " xs
    args :: String = intercalate ",\n" $ _args (init xs)
    selectorArgs :: String = intercalate ", " $ _args2 (init xs)
    result :: String = last xs

main :: IO ()
main = do
  printTypes printType
  printTypes printType2
  where
    printTypes printer = mapM_ putStrLn $ reverse $ loop printer letters
