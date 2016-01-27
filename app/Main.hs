module Main where

import Text.Read

data ThreeNumbers = ThreeNumbers Int Int Int deriving (Show)

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- readMaybe <$> getLine
  n2 <- readMaybe <$> getLine
  n3 <- readMaybe <$> getLine
  let nums = do
        n1' <- n1
        n2' <- n2
        n3' <- n3
        return (ThreeNumbers n1' n2' n3')
  print nums
