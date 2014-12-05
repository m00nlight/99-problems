{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


minNode' ∷ Int → Int → Int → Int
minNode' 0 h1 h2 = h1
minNode' 1 h1 h2 = h2
minNode' n h1 h2 = minNode' (n - 1) h2 (h1 + h2 + 1)


minNode ∷ Int → Int
minNode n = minNode' n 0 1

maxNode ∷ Int → Int
maxNode h = 2^h - 1


countNode ∷ Tree a → Int
countNode Empty = 0
countNode t@(Branch _ l r) = 1 + countNode l + countNode r

hbalTree ∷ a → Int → [Tree a]
hbalTree _ 0 = [Empty]
hbalTree e 1 = [Branch e Empty Empty]
hbalTree e n =
    let sub₁ = hbalTree e (n - 1)
        sub₂ = hbalTree e (n - 2)
    in [Branch e x y | x ← sub₁, y ← sub₁] ++
       [Branch e x y | x ← sub₁, y ← sub₂] ++
       [Branch e x y | x ← sub₂, y ← sub₁]


hbalTreeNode ∷ a → Int → [Tree a]
hbalTreeNode x n =
    let maxHeight = last $ filter (\ x → minNode x ≤ n) [1..n]
        minHeight = last $ filter (\ x → maxNode x ≤ n) [1..n]
    in filter (\ x → (countNode x) ≡ n) (concatMap (\ y → hbalTree x y)
                                                       [minHeight..maxHeight])
