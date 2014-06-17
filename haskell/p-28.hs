import qualified Data.List as D
import qualified Data.Map as M

lsort :: [[a]] -> [[a]]
lsort = D.sortBy (\x y -> compare (length x) (length y))

lfsort :: [[a]] -> [[a]]
lfsort xs =
    let ls = map length xs
        gs = D.group $ D.sort ls
        lf = M.fromList  (map (\x -> (head x, length x)) gs)
    in
      D.sortBy (\x y -> compare (M.lookup (length x) lf)
                        (M.lookup (length y) lf)) xs

      D
-- testcase
-- *Main Data.List> lfsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
-- ["ijkl","o","abc","fgh","de","de","mn"]
