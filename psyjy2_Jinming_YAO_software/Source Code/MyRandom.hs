module MyRandom where

import System.Random
import Control.Monad.IO.Class


-- this module is used to make some random number

drawInt :: Int -> Int -> IO Int
drawInt x y = getStdRandom (randomR (x,y))

random_list :: Int -> IO [Int]
random_list 0 = return []
random_list n = do
    a <- drawInt 1 20
    rest <- (random_list(n-1))
    return (a : rest)
