{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


tree4 = Branch 1
        (Branch 2 Empty (Branch 4 Empty Empty))
        (Branch 2 Empty Empty)

countLeaves ∷ Tree a → Int
countLeaves Empty = 0
countLeaves (Branch _ Empty Empty) = 1
countLeaves (Branch _ l r) = countLeaves l + countLeaves r


leaves ∷ Tree a → [a]
leaves Empty = []
leaves (Branch x Empty Empty) = [x]
leaves (Branch x l r) = leaves l ++ leaves r
