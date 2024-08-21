# Echidna Solution

```javascript
$ echidna src/intro/exercise-2/solution.sol --contract TestToken
[2024-08-19 20:37:40.30] Compiling src/exercise-2/solution.sol... Done! (0.6014163s)
Analyzing contract: solution.sol:TestToken
[2024-08-19 20:37:40.95] Running slither on src/exercise-2/solution.sol... Done! (0.7963692s)
[2024-08-19 20:37:41.77] [Worker 3] Test echidna_no_transfer falsified!
  Call sequence:
solution.sol.transfer(0xffffffff,77757622938815570382772810449500302604688759174109323486823153939560316389190) Time delay: 207289 seconds Block delay: 15367
solution.sol.Owner() Time delay: 414736 seconds Block delay: 2526
solution.sol.resume() Time delay: 407328 seconds Block delay: 2512

[2024-08-19 20:37:41.78] [Worker 1] New coverage: 261 instr, 1 contracts, 1 seqs in corpus
[2024-08-19 20:37:41.78] [Worker 1] Test limit reached. Stopping.
[2024-08-19 20:37:41.78] [Worker 2] New coverage: 261 instr, 1 contracts, 2 seqs in corpus
[2024-08-19 20:37:41.78] [Worker 2] Test limit reached. Stopping.
[2024-08-19 20:37:41.78] [Worker 0] New coverage: 261 instr, 1 contracts, 3 seqs in corpus
[2024-08-19 20:37:41.78] [Worker 0] Test limit reached. Stopping.
[2024-08-19 20:37:41.78] [Worker 3] New coverage: 261 instr, 1 contracts, 4 seqs in corpus
[2024-08-19 20:37:42.14] [Worker 3] Test limit reached. Stopping.
[2024-08-19 20:37:42.14] [status] tests: 1/1, fuzzing: 404/50000, values: [], cov: 261, corpus: 4
echidna_no_transfer: failed!💥
  Call sequence:
    solution.sol.Owner()
    solution.sol.resume()

Traces:



Unique instructions: 261
Unique codehashes: 1
Corpus size: 4
Seed: 8724706128155836949


```

# Exercise 2

**Table of contents:**

- [Echidna Solution](#echidna-solution)
- [Exercise 2](#exercise-2)
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

- Consider `paused()` to be called at deployment, and the ownership removed.
- Add a property to check that the contract cannot be unpaused.
- Once Echidna finds the bug, fix the issue, and re-try your property with Echidna.

The skeleton for this exercise is in [template.sol](./template.sol):

```Solidity
   import "token.sol";
   contract TestToken is Token {
      address echidna_caller = msg.sender;
      constructor(){
         paused(); // pause the contract
         owner = 0x0; // lose ownership
       }
      // add the property
      function echidna_no_transfer() public view returns (bool) {}
   }
```

## Solution & Testing

This solution can be found in [solution.sol](./solution.sol)
