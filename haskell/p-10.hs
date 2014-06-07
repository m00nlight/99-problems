import Data.List

encode lst = map (\ x -> (length x, head x))  (Data.List.group lst)
