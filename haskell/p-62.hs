{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


tree4 = Branch 1
        (Branch 2 Empty (Branch 4 Empty Empty))
        (Branch 2 Empty Empty)


internals ∷ Tree a → [a]
internals Empty = []
internals (Branch x Empty Empty) = []
internals (Branch x l r ) = internals l ++ [x] ++ internals r


atLevel ∷ Tree a → Int → [a]
atLevel (Branch x _ _) 1 = [x]
atLevel (Branch x l r) n = atLevel l (n - 1) ++ atLevel r (n - 1)
