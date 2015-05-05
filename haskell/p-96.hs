import qualified Data.Char as C

identifier :: String -> Bool
identifier []     = False
identifier (p:ps) = C.isAlpha p && loop ps
    where loop []              = True
          loop (x:xs)
              | x == '-'       = (not . null) xs && C.isAlphaNum (head xs) &&
                                 loop (tail xs)
              | C.isAlphaNum x = loop xs
              | otherwise      = False

main :: IO ()
main = do
  print $ identifier "this-is-a-long-identifier"
  print $ identifier "this-end-in-"
  print $ identifier "two--hyper"
