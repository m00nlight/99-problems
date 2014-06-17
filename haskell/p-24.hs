import System.Random

diffSelect :: (Num a, Random a) => Int -> a -> IO [a]
diffSelect n m = do
  gen <- getStdGen
  return . take n $ randomRs (1, m) gen
