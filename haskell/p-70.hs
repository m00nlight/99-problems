{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode
import Data.List


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


treeToString ∷ Tree Char → String
treeToString t@(Node e []) = [e]
treeToString t@(Node e childrens) =
    [e] ++ (concat $ intersperse "^" (map treeToString childrens)) ++ "^"
