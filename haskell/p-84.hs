import qualified Data.Map as M
import qualified Data.List as L

type Weight = Integer

data Graph a b = Graph [a] [(a, a, b)] deriving (Show, Eq)

-- | 'eliminate' return value of a maybe type
eliminate :: Maybe a -> a
eliminate Nothing = error "Found Nothing"
eliminate (Just a) = a

-- | 'ufFind' find the father in union find set
ufFind :: (Ord a) => M.Map a a -> a -> a
ufFind uf a = until (\ x -> M.lookup x uf == Just x)
              (\ x -> eliminate $ M.lookup x uf) a

-- | 'compressPath' do path compression of union find set
compressPath :: (Ord a) => M.Map a a -> a -> M.Map a a
compressPath uf a = aux ps
    where
      fa = ufFind uf a
      ps = L.takeWhile (/=fa) $
           iterate (\x -> eliminate $ M.lookup x uf) a
      aux ns = foldr (\ x acc -> M.update (\ _ -> Just fa) x acc) uf ns



-- | 'msTree' return the edges of mininum spanning tree of a graph
msTree :: (Ord a, Ord b, Num b) => Graph a b -> [(a, a, b)]
msTree (Graph n e) = kruscal ns es []
    where
      ns = M.fromList $ map (\ x -> (x, x)) n
      es = L.sortBy (\ (_,_,w1) (_,_,w2) -> w1 `compare` w2) e
      kruscal _ [] acc             = acc
      kruscal uf ((a,b,w):es') acc =
          let fa = ufFind uf a
              fb = ufFind uf b
              u2 = compressPath (compressPath uf a) b
          in if fa == fb then
                 kruscal u2 es' acc
             else
                 kruscal (M.update (\ _ -> Just fb) fa u2) es'
                         ((a,b,w):acc)
g1 :: Graph Char Weight
g1 = Graph ['a', 'b', 'c'] [('a', 'b', 1), ('a','c',2),('b','c',3)]
g2 :: Graph Int Weight
g2 = Graph [1,2,3,4] [(1,2,1), (2,3,1), (3,4,1), (4,1,1), (1,3,4), (2,4,4)]
g3 :: Graph Char Double
g3 = Graph ['a', 'b', 'c', 'd'] [('a', 'b', sqrt 3), ('b', 'c', sqrt 3),
                                 ('a', 'c', sqrt 3), ('a', 'd', 1),
                                 ('b', 'd', 1), ('c', 'd', 1)]

main :: IO ()
main = do
  putStrLn $ show $ msTree g1
  putStrLn $ show $ msTree g2
  putStrLn $ show $ msTree g3

-- ~/Documents/github/mine/99-problems/haskell $ runhaskell p-84.hs
-- [('a','c',2),('a','b',1)]
-- [(3,4,1),(2,3,1),(1,2,1)]
-- [('c','d',1.0),('b','d',1.0),('a','d',1.0)]
