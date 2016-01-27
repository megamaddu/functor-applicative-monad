module Main where

data ThreeNumbers = ThreeNumbers Int Int Int deriving (Show)

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- getLine
  n2 <- getLine
  n3 <- getLine
  let nums = ThreeNumbers (read n1)
                          (read n2)
                          (read n3)
  print nums
