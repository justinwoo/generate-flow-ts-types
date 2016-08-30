{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Text.Printf
import Data.List
import Data.Char

import Printer

letters :: [String]
letters =
  [ "A" , "B" , "C" , "D" , "E" , "F" , "G"]

_params :: [String] -> [String]
_params =
  fmap (++ ": Object")

_args :: [String] -> [String]
_args =
  fmap argify
  where
    lc xs = [toLower x | x <- xs]
    argify x = lc x ++ ": " ++ x

printType :: Printer
printType xs =
  printf
    "assign<%s>(%s): %s;"
    params
    args
    result
  where
    params :: String = intercalate ", " $ _params xs
    args :: String = intercalate ", " $ _args xs
    result :: String = intercalate " & " xs

main :: IO ()
main = mapM_ putStrLn $ reverse $ loop printType letters
