{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

type Nodes = [Char]

type Edges = [(Char, Char)]

data Graph = Graph Nodes Edges deriving (Show, Eq)

type Adj = [(Char, Nodes)]



graph2Adj ∷ Graph → Adj
graph2Adj (Graph nodes edges) = map (\ x → buildAdj x edges) nodes
    where
      sn ∷ Char → (Char, Char) → Char
      sn n (x, y) = if x ≡ n then y else x
      buildAdj ∷ Char → Edges → (Char, Nodes)
      buildAdj n edges = (n, map (\ x → sn n x)
                               (filter (\ (x, y) → (x ≡ n) ∨ (y ≡ n)) edges))
