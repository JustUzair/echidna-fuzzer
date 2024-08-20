// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";

contract TestToken is Token {
    address echidna_caller = msg.sender;

    constructor() {
        paused(); // pause the contract
        owner = address(0); // lose ownership
    }
    // add the property

    function echidna_no_transfer() public view returns (bool) {
        return is_paused == true;
    }
}
