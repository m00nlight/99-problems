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


bottomUp ∷  Tree Char → String
bottomUp t@(Node e []) = [e]
bottomUp t@(Node e childrens) =
    (concat $ map bottomUp childrens) ++ [e]
