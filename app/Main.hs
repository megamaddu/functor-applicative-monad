module Main where

import Data.List
import Text.Read

data ThreeNumbers = ThreeNumbers Int Int Int deriving (Show)

data Validation a = Failure [(String, String)]
                  | Success a

(<?>) :: Maybe a -> (String, String) -> Validation a
Just a  <?> _ = Success a
Nothing <?> e = Failure [e]

instance Show a => Show (Validation a) where
  show (Success a) = "Success:\n" ++ show a
  show (Failure e) = intercalate "\n- " ("It broke:" : (showError <$> e))
    where showError (a, b) = a ++ ": " ++ b

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- readMaybe <$> getLine
  n2 <- readMaybe <$> getLine
  n3 <- readMaybe <$> getLine
  let nums = ThreeNumbers <$> n1 <*> n2 <*> n3
  print nums
