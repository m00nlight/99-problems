{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode


fst' ∷ (Eq a, Eq b) ⇒ (a, b, Int) → a
fst' (x, _, _) = x

snd' ∷ (Eq a, Eq b) ⇒ (a, b, Int) → b
snd' (_, y, _) = y
