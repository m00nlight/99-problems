import System.Random

rndSelect :: [a] -> Int -> IO [a]
rndSelect xs n = do
  gen <- getStdGen
  return $ take n [xs !! x | x <- randomRs (0, (length xs) - 1) gen]
