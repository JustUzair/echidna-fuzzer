# Solution & Testing (Fuzzing the arithmetic functions of abdk math lib)

## Passing Tests

```javascript
$ echidna src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol --contract Solution --config src/fuzzing-artihmetics-and-functions/abdk-math/config.yaml
[2024-08-20 16:55:31.39] Compiling src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol... Done! (0.7730584s)
Analyzing contract: src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol:Solution
[2024-08-20 16:55:32.28] Running slither on src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol... Done! (1.0398588s)
[2024-08-20 16:55:33.34] [Worker 2] New coverage: 208 instr, 1 contracts, 1 seqs in corpus
[2024-08-20 16:55:33.34] [Worker 0] New coverage: 208 instr, 1 contracts, 2 seqs in corpus
[2024-08-20 16:55:33.40] [Worker 3] New coverage: 253 instr, 1 contracts, 3 seqs in corpus
[2024-08-20 16:55:33.47] [Worker 1] New coverage: 256 instr, 1 contracts, 4 seqs in corpus
[2024-08-20 16:55:34.78] [Worker 0] Test limit reached. Stopping.
[2024-08-20 16:55:34.82] [Worker 3] Test limit reached. Stopping.
[2024-08-20 16:55:34.91] [Worker 1] Test limit reached. Stopping.
[2024-08-20 16:55:34.94] [Worker 2] Test limit reached. Stopping.
[2024-08-20 16:55:34.94] [status] tests: 0/4, fuzzing: 50194/50000, values: [], cov: 256, corpus: 4
add_sub_inverse_operations(int128,int128): passing
div_test_not_commutative(int128,int128): passing
add_test_associative(int128,int128,int128): passing
AssertionFailed(..): passing


Unique instructions: 256
Unique codehashes: 1
Corpus size: 4
Seed: 5149478206124100029
```

## Failing tests before fixing the issues

```javascript
$ echidna src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol --contract Solution --config src/fuzzing-artihmetics-and-functions/abdk-math/config.yaml
[2024-08-20 17:02:05.51] Compiling src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol... Done! (0.5545498s)
Analyzing contract: src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol:Solution
[2024-08-20 17:02:06.11] Running slither on src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol... Done! (0.811979s)
[2024-08-20 17:02:06.93] [Worker 1] Test add_sub_inverse_operations(int128,int128) falsified!
  Call sequence:
src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol.add_test_associative(124203550191229793015871233070730405094,-340282366920938463463374607431768211456,109800762693309776714894356962289184803) from: 0x0000000000000000000000000000000000010000 Time delay: 198598 seconds Block delay: 4462
src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol.add_test_associative(-340282366920938463463374607431768211456,-340282366920938463463374607431768211456,37656807646286498288416792552739072621) from: 0x0000000000000000000000000000000000030000 Time delay: 322374 seconds Block delay: 3661
src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol.add_sub_inverse_operations(125519111526493269810470086837213780993,32110171996292234875443557314001288380) from: 0x0000000000000000000000000000000000020000 Time delay: 511063 seconds Block delay: 127

[2024-08-20 17:02:06.94] [Worker 1] New coverage: 404 instr, 1 contracts, 1 seqs in corpus
[2024-08-20 17:02:06.94] [Worker 3] New coverage: 404 instr, 1 contracts, 2 seqs in corpus
[2024-08-20 17:02:07.00] [Worker 2] New coverage: 415 instr, 1 contracts, 3 seqs in corpus
[2024-08-20 17:02:07.16] [Worker 0] New coverage: 418 instr, 1 contracts, 4 seqs in corpus
[2024-08-20 17:02:08.40] [Worker 0] Test limit reached. Stopping.
[2024-08-20 17:02:08.43] [Worker 3] Test limit reached. Stopping.
[2024-08-20 17:02:08.48] [Worker 2] Test limit reached. Stopping.
[2024-08-20 17:02:08.55] [Worker 1] Test limit reached. Stopping.
[2024-08-20 17:02:08.55] [status] tests: 1/4, fuzzing: 50174/50000, values: [], cov: 418, corpus: 4
add_sub_inverse_operations(int128,int128): failed!💥
  Call sequence:
    src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol.add_sub_inverse_operations(0,0)

Traces:
emit Debug(0, 0) (src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol:262)
emit Debug(1, 1) (src/fuzzing-artihmetics-and-functions/abdk-math/Solution.sol:265)

div_test_not_commutative(int128,int128): passing
add_test_associative(int128,int128,int128): passing
AssertionFailed(..): passing


Unique instructions: 418
Unique codehashes: 1
Corpus size: 4
Seed: 7825624698799598958


```
