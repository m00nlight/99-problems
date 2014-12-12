
data Tree a = Empty | Branch a (Tree a) (Tree a)
              deriving (Show, Eq)


t3 = Branch 'a' (Branch 'b' Empty Empty) (Branch 'c' Empty Empty)

tree2Preorder :: Tree a -> [a]
tree2Preorder Empty = []
tree2Preorder (Branch e l r) = [e] ++ (tree2Preorder l) ++ (tree2Preorder r)


tree2Inorder :: Tree a -> [a]
tree2Inorder Empty = []
tree2Inorder (Branch e l r) = (tree2Inorder l) ++ [e] ++ (tree2Inorder r)
