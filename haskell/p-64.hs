{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)

type TreeRes a = Tree (a, (Int, Int))

tree7 = Branch 'a' (Branch 'b' (Branch 'c' Empty Empty)
                               (Branch 'd' Empty Empty))
                   (Branch 'e' (Branch 'f' Empty Empty)
                               (Branch 'g' Empty Empty))

tree64 = Branch 'n'
                (Branch 'k'
                        (Branch 'c'
                                (Branch 'a' Empty Empty)
                                (Branch 'h'
                                        (Branch 'g'
                                                (Branch 'e' Empty Empty)
                                                Empty
                                        )
                                        Empty
                                )
                        )
                        (Branch 'm' Empty Empty)
                )
                (Branch 'u'
                        (Branch 'p'
                                Empty
                                (Branch 's'
                                        (Branch 'q' Empty Empty)
                                        Empty
                                )
                        )
                        Empty
                )


layout' ∷ Tree Char → Int → Int → (TreeRes Char, Int, Int)
layout' Empty x y= (Empty, x - 1, y)
layout' t@(Branch e Empty Empty) x y =
    (Branch (e, (x, y)) Empty Empty, x, y)
layout' t@(Branch e l r) x y =
    let (left, xl, yl) = layout' l x (y + 1)
        (right, xr, yr) = layout' r (xl + 2) (y + 1)
    in (Branch (e, (xl + 1, y)) left right, xr, y)



layout ∷ Tree Char → TreeRes Char
layout t =
    let (res, _, _) = layout' t 1 1
    in res
