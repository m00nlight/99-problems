

import Prelude
import Data.List

data Graph a = Graph [a] [(a, a)]
               deriving (Show, Eq)

k4 = Graph ['a', 'b', 'c', 'd']
     [('a', 'b'), ('b', 'c'), ('c', 'd'), ('d', 'a'), ('a', 'c'), ('b', 'd')]

paths :: (Eq a) => a -> a -> [(a,a)] -> [[a]]
paths source sink edges
    | source == sink = [[sink]]
    | otherwise = [[source] ++ path |
                   edge <- edges, (fst edge) == source,
                   path <- (paths (snd edge) sink [e | e <- edges, e /= edge])
                  ]


cycles :: (Eq a) => a -> [(a, a)] -> [[a]]
cycles source edges
    | edges == [] = []
    | otherwise = [[source] ++ p |
                   edge <- edges, (fst edge) == source,
                   p <- (paths (snd edge) source [e | e <- edges, e /= edge])
                  ]


spanTree :: (Eq a) => [(a,a,Int)] -> [[a]]
spanTree edges = map (\ x -> init x)
                 (filter (\ x -> length x == length nodes + 1) (help ee))
    where
      nodes = nub $ concatMap (\ (x, y, z) -> [x,y]) edges
      ee = map (\(x,y,z) -> (x, y)) edges
      help ee = concatMap (\ x -> cycles x ee) nodes
