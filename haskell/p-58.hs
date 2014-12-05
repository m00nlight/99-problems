{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


cbalTree ∷ (Integral a) ⇒ a → [Tree Char]
cbalTree 0 = [Empty]
cbalTree n =
    if n `mod` 2 ≡ 1
    then let sub = cbalTree $ (n - 1) `div` 2
         in [Branch 'x' x y | x ← sub, y ← sub]
    else let sub1 = cbalTree $ (n - 1) `div` 2
             sub2 = cbalTree $ (n - 1) `div` 2 + 1
         in [Branch 'x' x y | x ← sub1, y ← sub2] ++
            [Branch 'x' y x | x ← sub1, y ← sub2]


mirror ∷ Tree t → Tree t → Bool
mirror Empty Empty = True
mirror Empty _ = False
mirror _ Empty = False
mirror (Branch _ l1 r1) (Branch _ l2 r2) =
    mirror r1 l2 ∧ mirror l1 r2

symmetric ∷ Tree t → Bool
symmetric Empty = True
symmetric (Branch _ left right) = mirror left right


symCbalTree ∷ Int → [Tree Char]
symCbalTree n = [x | x ← cbalTree n, symmetric x]
