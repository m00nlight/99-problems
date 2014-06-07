myButLast :: [t] -> t
myButLast [] = error "Empty list"
myButLast [x] = error "List with ony one element"
myButLast (x:y:[]) = x
myButLast (x:y:zs) = myButLast (y:zs)

-- Simple function composition solution
myButLast' :: [c] -> c
myButLast' = head . tail . reverse
