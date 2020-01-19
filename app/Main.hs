module Main where

import           Control.Applicative (liftA2)
import           Control.Monad       (fmap)
import           Data.Maybe          (fromMaybe)
import qualified Data.List           as List
import qualified Data.Text.Lazy      as L
import           Data.Text.Lazy.IO   as LIO
import           System.Environment  (getArgs)
import           System.Random       (getStdGen, randomRs, RandomGen)

main :: IO ()
main = do
  n <- parseNFromArgs
  g <- getStdGen
  adjectives <- L.splitOn "\n" <$> LIO.readFile "assets/adjectives/english-adjectives.txt"
  nouns <- L.splitOn "\n" <$> LIO.readFile "assets/nouns/positive-nouns.txt"
  let adjFound = getFound g n adjectives
      nounFound = getFound g n nouns
  LIO.putStrLn . L.concat $
     zipWith (\l r -> L.concat [l, L.pack " ", r, L.pack "\n"]) adjFound nounFound

  where
    getFound :: (RandomGen g) => g -> Int -> [L.Text] -> [L.Text]
    getFound g n l = fmap (\idx -> l List.!! idx) $
                       List.take n (randomRs (0, length l - 1) g :: [Int])
    parseNFromArgs :: IO Int
    parseNFromArgs = do
      raw <- getArgs
      let n = read $ fromMaybe defaultN $ safeHead $ raw ::Int
      if n < 1 then error "N must be at least 1"
      else
        return n
    safeHead :: [a] -> Maybe a
    safeHead l = Prelude.foldr (\x _ -> Just x) Nothing l

    defaultN = "100"
