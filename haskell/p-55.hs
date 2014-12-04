{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


cbalTree ∷ (Integral a) ⇒ a → [Tree Char]
cbalTree 0 = [Empty]
cbalTree n =
    if n `mod` 2 ≡ 1
    then let sub = cbalTree $ (n - 1) `div` 2
         in [Branch 'x' x x | x ← sub]
    else let sub1 = cbalTree $ (n - 1) `div` 2
             sub2 = cbalTree $ (n - 1) `div` 2 + 1
         in [Branch 'x' x y | x ← sub1, y ← sub2] ++
            [Branch 'x' y x | x ← sub1, y ← sub2]
