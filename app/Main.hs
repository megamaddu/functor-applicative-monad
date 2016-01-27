module Main where

import Text.Read

data ThreeNumbers = ThreeNumbers Int Int Int deriving (Show)

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- getLine
  n2 <- getLine
  n3 <- getLine
  let nums =
        case readMaybe n1 of
          Nothing -> Nothing
          Just n1' ->
            case readMaybe n2 of
              Nothing -> Nothing
              Just n2' ->
                case readMaybe n3 of
                  Nothing -> Nothing
                  Just n3' -> Just (ThreeNumbers n1' n2' n3')
  print nums
