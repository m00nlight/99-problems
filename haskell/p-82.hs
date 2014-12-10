{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

paths ∷ Eq a ⇒ a  → a → [(a, a)] → [[a]]
paths source sink edges
    | source ≡ sink = [[sink]]
    | otherwise = [[source] ++ path |
                   edge ← edges, (fst edge) ≡ source,
                   path ← (paths (snd edge) sink [e | e ← edges, e ≢ edge])
                  ]


cycles ∷ Eq a ⇒ a → [(a, a)] → [[a]]
cycles source edges
    | edges ≡ [] = []
    | otherwise = [[source] ++ p |
                   edge ← edges, (fst edge) ≡ source,
                   p ← (paths (snd edge) source [e | e ← edges, e ≢ edge])
                  ]
