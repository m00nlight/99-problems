{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


mirror ∷ Tree t → Tree t → Bool
mirror Empty Empty = True
mirror Empty _ = False
mirror _ Empty = False
mirror (Branch _ l1 r1) (Branch _ l2 r2) =
    mirror r1 l2 ∧ mirror l1 r2

symmetric ∷ Tree t → Bool
symmetric Empty = True
symmetric (Branch _ left right) = mirror left right
