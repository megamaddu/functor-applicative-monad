module Main where

import Text.Read

data ThreeNumbers = ThreeNumbers Int Int Int deriving (Show)

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- readMaybe <$> getLine
  n2 <- readMaybe <$> getLine
  n3 <- readMaybe <$> getLine
  let nums = ThreeNumbers <$> n1 <*> n2 <*> n3
  print nums
