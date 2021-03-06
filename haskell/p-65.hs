{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)

type TreeRes a = Tree (a, (Int, Int))

tree7 = Branch 'a' (Branch 'b' (Branch 'c' Empty Empty)
                               (Branch 'd' Empty Empty))
                   (Branch 'e' (Branch 'f' Empty Empty)
                               (Branch 'g' Empty Empty))

tree65 = Branch 'n'
                (Branch 'k'
                        (Branch 'c'
                                (Branch 'a' Empty Empty)
                                (Branch 'e'
                                        (Branch 'd' Empty Empty)
                                        (Branch 'g' Empty Empty)
                                )
                        )
                        (Branch 'm' Empty Empty)
                )
                (Branch 'u'
                        (Branch 'p'
                                Empty
                                (Branch 'q' Empty Empty)
                        )
                        Empty
                )


depth ∷ Tree a → Int
depth Empty = 0
depth t@(Branch e l r) = max (depth l + 1) (depth r + 1)


leftDepth ∷ Tree a → Int
leftDepth Empty = 0
leftDepth (Branch a l r) = leftDepth l + 1

layout ∷ Tree Char → TreeRes Char
layout t = layout' x1 1 sep1 t
    where d = depth t
          ld = leftDepth t
          x1 = 2^(d - 1) - 2^(d - ld) + 1
          sep1 = 2^(d - 2)
          layout' x y sep Empty = Empty
          layout' x y sep (Branch e l r) =
              Branch (e, (x, y))
                     (layout' (x - sep) (y + 1) (sep `div` 2) l)
                     (layout' (x + sep) (y + 1) (sep `div` 2) r)
