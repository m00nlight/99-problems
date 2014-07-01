import Data.Time

--primes :: [Int]
primes = sieve [2..]
    where
      sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

--primes2 :: Int -> [Int]
primes2 n = sieve [2..n]
    where
      sieve []     = []
      sieve (p:xs) = p : (sieve $! [x | x <- xs, x `mod` p > 0])

run1 n = length (take n primes)

run2 f n = length (f n)

main = do
  print "start profiling for the lazy and strick sieve"
  let res1 = map run1 [22, 145, 1086, 2020, 3775, 7086, 13352]
      res2 = map (\x -> run2 primes2 x)
             [100, 1000, 10000, 20000, 40000, 80000, 160000]
  print res1
  print res2
  print "end profiling"
