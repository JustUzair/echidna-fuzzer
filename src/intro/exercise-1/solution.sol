// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";

contract TestToken is Token {
    address echidna_caller = msg.sender;

    constructor() {
        balances[echidna_caller] = 10000;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[echidna_caller] <= 10000;
    }
}
