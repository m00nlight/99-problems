import Data.List

data EncodeType a = Single a | Multiple Int a deriving (Show)

encode lst = map (\ x -> (length x, head x))  (Data.List.group lst)

encodeModified :: Eq a => [a] -> [EncodeType a]
encodeModified = map help . encode
    where
      help (1, x) = Single x
      help (n, x) = Multiple n x

decodeModified :: [EncodeType b] -> [b]
decodeModified = concatMap help
    where
      help (Single x) = [x]
      help (Multiple n x) = take n (repeat x)
