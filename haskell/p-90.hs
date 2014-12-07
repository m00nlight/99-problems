{-# LANGUAGE UnicodeSyntax #-}


import Prelude.Unicode
import Data.List


queues ∷ Int → [[Int]]
queues n = filter (\x → test (zip [1..n] x)) candidates
    where candidates = permutations [1..n]
          unSafe (x₁, y₁) (x₂, y₂) = (y₁ ≡ y₂) ∨
                                     ((abs (x₁ - x₂)) ≡ (abs (y₁ - y₂)))
          test [] = True
          test (q:qs) = (not $ (any (\x → unSafe q x) qs)) ∧ (test qs)
