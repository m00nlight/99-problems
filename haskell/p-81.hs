{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

paths ∷ Eq a ⇒ a  → a → [(a, a)] → [[a]]
paths source sink edges
    | source ≡ sink = [[sink]]
    | otherwise = [[source] ++ path |
                   edge ← edges, (fst edge) ≡ source,
                   path ← (paths (snd edge) sink [e | e ← edges, e ≢ edge])
                  ]
