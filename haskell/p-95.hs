import qualified Data.Map as M
import qualified Data.List as L

digit2Word :: M.Map Char String
digit2Word = M.fromList [('1', "one"), ('2' ,"two"), ('3', "three"),
                         ('4', "four"), ('5', "five"), ('6', "six"),
                         ('7', "seven"), ('8', "eight"), ('9', "nine")]

getVal :: Maybe a -> a
getVal Nothing = error "Nothing founded"
getVal (Just a) = a

fullWord :: String -> String
fullWord ss =
    L.intercalate "-" $ map (\x -> getVal $ M.lookup x digit2Word) ss

main :: IO ()
main = do
  putStrLn $ fullWord "175"
  putStrLn $ fullWord "1723"
