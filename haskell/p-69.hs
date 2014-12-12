
data Tree a = Empty | Branch a (Tree a) (Tree a)
              deriving (Show, Eq)

t3 = Branch 'a' (Branch 'b' Empty Empty) (Branch 'c' Empty Empty)


tree2ds :: Tree Char -> String
tree2ds Empty = ['.']
tree2ds (Branch e l r) = [e] ++ (tree2ds l) ++ (tree2ds r)
