# Echinda - Slither Remappings

- [Refer to this article](https://www.justinsilver.com/travel/slither-echidna-remappings/)

# Solution & Testing

```javascript
$ echidna src/fuzzing-artihmetics-and-functions/staker/Solution.sol --contract Solution --config  src/fuzzing-artihmetics-and-functions/staker/config.yaml
[2024-08-21 18:46:50.51] Compiling src/fuzzing-artihmetics-and-functions/staker/Solution.sol... Done! (0.7830464s)
Analyzing contract: src/fuzzing-artihmetics-and-functions/staker/Solution.sol:Solution
[2024-08-21 18:46:51.58] Running slither on src/fuzzing-artihmetics-and-functions/staker/Solution.sol... Done! (0.9081679s)
Loaded 2 transaction sequences from corpus\reproducers
Loaded 21 transaction sequences from corpus\coverage
[2024-08-21 18:46:52.58] [Worker 0] New coverage: 1794 instr, 3 contracts, 1 seqs in corpus
[2024-08-21 18:46:52.58] [Worker 0] Sequence replayed from corpus file 1350262054968902135.txt (1/23)
[2024-08-21 18:46:52.58] [Worker 0] Sequence replayed from corpus file 1127291024973358308.txt (2/23)
[2024-08-21 18:46:52.59] [Worker 0] New coverage: 1801 instr, 3 contracts, 2 seqs in corpus
[2024-08-21 18:46:52.59] [Worker 0] Sequence replayed from corpus file 8912149531751728125.txt (3/23)
[2024-08-21 18:46:52.59] [Worker 0] Sequence replayed from corpus file 8479938082521605539.txt (4/23)
[2024-08-21 18:46:52.65] [Worker 0] New coverage: 1804 instr, 3 contracts, 3 seqs in corpus
[2024-08-21 18:46:52.65] [Worker 0] Sequence replayed from corpus file 8413283272760311761.txt (5/23)
[2024-08-21 18:46:52.71] [Worker 0] Sequence replayed from corpus file 7795438124283135972.txt (6/23)
[2024-08-21 18:46:52.71] [Worker 0] Sequence replayed from corpus file 7704221010439149864.txt (7/23)
[2024-08-21 18:46:52.72] [Worker 0] Sequence replayed from corpus file 7697768746992575248.txt (8/23)
[2024-08-21 18:46:52.78] [Worker 0] Sequence replayed from corpus file 7109933266862146918.txt (9/23)
[2024-08-21 18:46:52.84] [Worker 0] Sequence replayed from corpus file 7087721474421706701.txt (10/23)
[2024-08-21 18:46:52.90] [Worker 0] Sequence replayed from corpus file 588268945861210668.txt (11/23)
[2024-08-21 18:46:52.96] [Worker 0] Sequence replayed from corpus file 5758944556550000121.txt (12/23)
[2024-08-21 18:46:52.96] [Worker 0] Sequence replayed from corpus file 5696712240772274053.txt (13/23)
[2024-08-21 18:46:53.02] [Worker 0] Sequence replayed from corpus file 5305655672707922058.txt (14/23)
[2024-08-21 18:46:53.08] [Worker 0] Sequence replayed from corpus file 5271670768787088693.txt (15/23)
[2024-08-21 18:46:53.14] [Worker 0] Sequence replayed from corpus file 4812642572297192942.txt (16/23)
[2024-08-21 18:46:53.20] [Worker 0] Sequence replayed from corpus file 466272490207339834.txt (17/23)
[2024-08-21 18:46:53.20] [Worker 0] Sequence replayed from corpus file 2911885872069943244.txt (18/23)
[2024-08-21 18:46:53.27] [Worker 0] Sequence replayed from corpus file 2203707314568759237.txt (19/23)
[2024-08-21 18:46:53.32] [Worker 0] Sequence replayed from corpus file 1426521217321067764.txt (20/23)
[2024-08-21 18:46:53.33] [Worker 0] Sequence replayed from corpus file 1350262054968902135.txt (21/23)
[2024-08-21 18:46:53.33] [Worker 0] Sequence replayed from corpus file 1127291024973358308.txt (22/23)
[2024-08-21 18:46:53.39] [Worker 0] New coverage: 1807 instr, 3 contracts, 4 seqs in corpus
[2024-08-21 18:46:53.39] [Worker 0] Sequence replayed from corpus file 1099032593416297649.txt (23/23)
[2024-08-21 18:46:55.58] [status] tests: 0/3, fuzzing: 5939/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:46:58.59] [status] tests: 0/3, fuzzing: 11851/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:01.60] [status] tests: 0/3, fuzzing: 17992/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:04.61] [status] tests: 0/3, fuzzing: 23659/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:07.62] [status] tests: 0/3, fuzzing: 29505/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:10.63] [status] tests: 0/3, fuzzing: 35141/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:13.63] [status] tests: 0/3, fuzzing: 40626/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:16.64] [status] tests: 0/3, fuzzing: 46356/50000, values: [], cov: 1807, corpus: 4
[2024-08-21 18:47:18.60] [Worker 0] Test limit reached. Stopping.
[2024-08-21 18:47:18.60] [status] tests: 0/3, fuzzing: 50030/50000, values: [], cov: 1807, corpus: 4
testUnstake(uint256): passing
testStake(uint256): passing
AssertionFailed(..): passing


Unique instructions: 1807
Unique codehashes: 3
Corpus size: 4
Seed: 9154057858165528799

[2024-08-21 18:47:18.60] Saving test reproducers... Done! (0s)
[2024-08-21 18:47:18.60] Saving corpus... Done! (0.0970013s)
```
