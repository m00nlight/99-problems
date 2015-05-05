
type Nodes a = [a]

type Edges a = [(a, a)]

data Graph a = Graph (Nodes a) (Edges a) deriving (Show, Eq)

type Adj a = [(a, Nodes a)]

g = Graph ['b','c','d','f','g','h','k']
    [('b','c'),('b','f'),('c','f'),('f','k'),('g','h')] :: Graph Char

graph2Adj :: (Eq a) => Graph a -> Adj a
graph2Adj (Graph nodes edges) = map (\ x -> buildAdj x edges) nodes
    where
      sn :: (Eq a) => a -> (a, a) -> a
      sn n (x, y) = if x == n then y else x
      buildAdj :: (Eq a ) => a -> Edges a -> (a, Nodes a)
      buildAdj n edges =
          (n, map (\ x -> sn n x)
                (filter (\ (x, y) -> (x == n) || (y == n)) edges))


-- λ> graph2Adj g
-- [('b',"cf"),('c',"bf"),('d',""),('f',"bck"),('g',"h"),('h',"g"),('k',"f")]
-- λ>
