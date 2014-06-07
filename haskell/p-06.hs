import Control.Arrow
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == (reverse xs)

palindrome :: Eq a => [a] -> Bool -- must need this type annotation
palindrome = uncurry (==) . (id &&& reverse)
