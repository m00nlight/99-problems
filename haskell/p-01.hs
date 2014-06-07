myLast :: [t] -> t
myLast [] = error "Empty list"
myLast [x] = x
myLast (x:xs) = myLast xs
