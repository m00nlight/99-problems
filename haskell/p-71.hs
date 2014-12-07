{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode


data Tree a = Node a [Tree a]
            deriving (Eq, Show)

tree1 = Node 'a' []

tree2 = Node 'a' [Node 'b' []]

tree3 = Node 'a' [Node 'b' [Node 'c' []]]

tree4 = Node 'b' [Node 'd' [], Node 'e' []]

tree5 = Node 'a' [
                Node 'f' [Node 'g' []],
                Node 'c' [],
                Node 'b' [Node 'd' [], Node 'e' []]
                ]

nnodes ∷ Tree a → Int
nnodes t@(Node _ []) = 1
nnodes t@(Node _ childs) =
    1 + foldl (+) 0 (map nnodes childs)



ipl ∷ Tree a → Int
ipl t@(Node _ []) = 0
ipl t@(Node _ childrens) =
    foldl (+) 0
          (map (\ (x, y) → x + y)
               (zip (map nnodes childrens) (map ipl childrens)))
