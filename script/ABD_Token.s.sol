// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script, console2} from "forge-std/Script.sol";
import {ABD_Token} from "../src/ABD_Token.sol";
import "forge-std/console.sol";

contract ABD_TokenScript is Script {
    function setUp() public {}

    function run() external returns (ABD_Token) {
        vm.startBroadcast();

        // Example total supply value
        uint256 totalSupply = 1000000 * 10 ** 18;

        // Deploy the ABD_Token contract with the specified total supply
        ABD_Token abd_token = new ABD_Token(totalSupply);

        vm.stopBroadcast();
        return abd_token;
    }
}
