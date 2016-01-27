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

instance Functor Validation where
  fmap f (Success a) = Success (f a)
  fmap _ (Failure e) = Failure e

instance Applicative Validation where
  pure = Success

  Success f <*> Success a = Success (f a)
  Success _ <*> Failure e = Failure e
  Failure e <*> Failure d = Failure (e ++ d)
  Failure e <*> _         = Failure e

instance Monad Validation where
  Failure e >>= _ = Failure e
  Success a >>= f = f a

main :: IO ()
main = do
  putStrLn "Gimme 3 numbers!"
  n1 <- readMaybe <$> getLine
  n2 <- readMaybe <$> getLine
  n3 <- readMaybe <$> getLine
  let nums = do
        n1' <- n1 <?> ("n1", "that's not a number!")
        n2' <- n2 <?> ("n2", "neither is that!!")
        n3' <- n3 <?> ("n3", "really?!")
        return (ThreeNumbers n1' n2' n3')
  print nums
