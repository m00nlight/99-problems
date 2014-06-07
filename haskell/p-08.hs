import Data.List

compress :: Eq a => [a] -> [a]
compress = map head . group


compress' lst = map head $ group lst
