#!/bin/sh
ghc -prof -fprof-auto -rtsopts sieve.hs
./sieve +RTS -p -h -xt
hp2ps sieve.hp
echo "Lazy and strick sieve finish...."
ghc -prof -fprof-auto -rtsopts sieveArray.hs
./sieveArray +RTS -p -h -xt
hp2ps sieveArray.hp
echo "Array version sieve finish..."
echo "See sieve.prof sieve.ps and sieveArray.prof sieveArray.ps"
echo "for time profiling and memory usage profiling"
