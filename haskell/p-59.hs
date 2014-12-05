{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


hbalTree ∷ a → Int → [Tree a]
hbalTree _ 0 = [Empty]
hbalTree e 1 = [Branch e Empty Empty]
hbalTree e n =
    let sub₁ = hbalTree e (n - 1)
        sub₂ = hbalTree e (n - 2)
    in [Branch e x y | x ← sub₁, y ← sub₁] ++
       [Branch e x y | x ← sub₁, y ← sub₂] ++
       [Branch e x y | x ← sub₂, y ← sub₁]
