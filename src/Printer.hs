module Printer where

type Printer = [String] -> String

loop :: Printer -> [String] -> [String]
loop printer xs =
  if null xs
    then mempty
    else loop printer (init xs) ++ [printer xs]
