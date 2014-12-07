{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

data Tree a = Empty | Branch a (Tree a) (Tree a)
            deriving (Show, Eq)


treeToString :: Tree Char -> String
treeToString Empty = ""
treeToString (Branch x Empty Empty) = [x]
treeToString (Branch x l r) =
        x : '(' : treeToString l ++ "," ++ treeToString r ++ ")"

stringToTree :: (Monad m) => String -> m (Tree Char)
stringToTree "" = return Empty
stringToTree [x] = return $ Branch x Empty Empty
stringToTree str = tfs str >>= \ ("", t) -> return t
    where tfs a@(x:xs) | x == ',' || x == ')' = return (a, Empty)
          tfs (x:y:xs)
                | y == ',' || y == ')' = return (y:xs, Branch x Empty Empty)
                | y == '(' = do (',':xs', l) <- tfs xs
                                (')':xs'', r) <- tfs xs'
                                return $ (xs'', Branch x l r)
          tfs _ = fail "bad parse"
