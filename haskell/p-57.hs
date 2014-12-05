{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)



add ∷ Ord a ⇒ a → Tree a → Tree a
add x Empty = Branch x Empty Empty
add x t@(Branch y l r) =
    if x ≤ y
    then Branch y (add x l) r
    else Branch y l (add x r)


construct ∷ Ord a ⇒ [a] → Tree a
construct xs = foldr add Empty xs
