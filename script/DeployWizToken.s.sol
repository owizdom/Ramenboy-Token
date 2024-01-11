//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {WizToken} from "../src/WizToken.sol";

contract DeployWizToken is Script {
    uint256 public constant INITIAL_AMOUNT = 1000 ether;

    function run() external returns (WizToken) {
        vm.startBroadcast();
        WizToken wt = new WizToken(INITIAL_AMOUNT);
        vm.stopBroadcast();
        return wt;
    }
}
