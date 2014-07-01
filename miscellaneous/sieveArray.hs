import Data.Array.Unboxed

primesToA m = sieve 3 (array (3,m) [(i,odd i) | i<-[3..m]] :: UArray Int Bool)
  where
    sieve p a
      | p*p > m   = 2 : [i | (i,True) <- assocs a]
      | a!p       = sieve (p+2) $ a//[(i,False) | i <- [p*p, p*p+2*p..m]]
      | otherwise = sieve (p+2) a

run2 f n = length (f n)

main = do
  print "start profiling array version of sieve"
  let res = map (\x -> run2 primesToA x)
            [100, 1000, 10000, 20000, 40000, 80000, 160000]
  print res
  print "end profiling"
