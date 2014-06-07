
myReverse :: [a] -> [a]
myReverse lst = myReverse' lst []
    where
      myReverse' [] acc = acc
      myReverse' (x:xs) acc = myReverse' xs (x:acc)
