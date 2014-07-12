**Create unoptimized func1_unopt.s LLVM IR**

clang -c -S func1.c -O0 -emit-llvm -o func1_unopt.s

**Create optimized func1.bc**

opt func1_unopt.s *some arguments here* -o func1.bc

**Create optimized func1.s assembly**

llc func1.bc
