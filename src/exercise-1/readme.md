# Echidna Solution

```javascript
$ solc-select use 0.8.20
Switched global version to 0.8.20

$ echidna src/exercise-1/solution.sol
[2024-08-19 16:28:21.29] Compiling src/exercise-1/solution.sol... Done! (0.3919586s)
Multiple contracts found, only analyzing the first
Analyzing contract: C:/Users/USER/Desktop/JustUzair-Web3/echidna-learn/echidna-workshop/src/exercise-1/solution.sol:TestToken
[2024-08-19 16:28:21.69] Running slither on src/exercise-1/solution.sol... Done! (0.5350037s)
[2024-08-19 16:28:22.24] [Worker 1] New coverage: 320 instr, 1 contracts, 1 seqs in corpus
[2024-08-19 16:28:22.24] [Worker 3] New coverage: 320 instr, 1 contracts, 2 seqs in corpus
[2024-08-19 16:28:22.24] [Worker 2] New coverage: 320 instr, 1 contracts, 3 seqs in corpus
[2024-08-19 16:28:22.24] [Worker 0] New coverage: 320 instr, 1 contracts, 4 seqs in corpus
[2024-08-19 16:28:22.25] [Worker 3] New coverage: 379 instr, 1 contracts, 5 seqs in corpus
[2024-08-19 16:28:22.97] [Worker 0] Test limit reached. Stopping.
[2024-08-19 16:28:22.98] [Worker 1] Test limit reached. Stopping.
[2024-08-19 16:28:22.98] [Worker 3] Test limit reached. Stopping.
[2024-08-19 16:28:22.98] [Worker 2] Test limit reached. Stopping.
[2024-08-19 16:28:22.98] [status] tests: 0/1, fuzzing: 50292/50000, values: [], cov: 379, corpus: 5
echidna_test_balance: passing


Unique instructions: 379
Unique codehashes: 1
Corpus size: 5
Seed: 867098088360925686

```

# Exercise 1

**Table of contents:**

- [Echidna Solution](#echidna-solution)
- [Exercise 1](#exercise-1)
  - [Target contract](#target-contract)
  - [Exercise](#exercise)
    - [Goals](#goals)
  - [Solution](#solution)

Join the team on Slack at: https://slack.empirehacking.nyc/ #ethereum

## Target contract

We will test the following contract (see [token.sol](./token.sol)):

```Solidity
 contract Ownership{
    address owner = msg.sender;
    function Owner(){
         owner = msg.sender;
     }
     modifier isOwner(){
         require(owner == msg.sender);
         _;
      }
   }

  contract Pausable is Ownership{
     bool is_paused;
     modifier ifNotPaused(){
              require(!is_paused);
              _;
      }

      function paused() isOwner public{
          is_paused = true;
      }

      function resume() isOwner public{
          is_paused = false;
      }
   }

   contract Token is Pausable{
      mapping(address => uint) public balances;
      function transfer(address to, uint value) ifNotPaused public{
           balances[msg.sender] -= value;
           balances[to] += value;
       }
    }

```

## Exercise

### Goals

- Add a property to check that `echidna_caller` cannot have more than an initial balance of 10000.
- Once Echidna finds the bug, fix the issue, and re-check your property with Echidna.

```Solidity
     import "token.sol";
     contract TestToken is Token {
       address echidna_caller = msg.sender;

        constructor() public{
            balances[echidna_caller] = 10000;
         }
         // add the property
        function echidna_test_balance() public view returns (bool) {}
      }
```

## Solution

This solution can be found in [solution.sol](./solution.sol)
