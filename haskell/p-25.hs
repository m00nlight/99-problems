import System.Random (randomRIO)


rndPermu :: [a] -> IO [a]
rndPermu [] = return []
rndPermu (x:xs) = do
  rand <- randomRIO (0, length xs)
  rest <- rndPermu xs
  return $ let (ys, zs) = splitAt rand rest
           in ys ++ (x:zs)
