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
