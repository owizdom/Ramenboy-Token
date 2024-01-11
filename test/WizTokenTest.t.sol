//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployWizToken} from "../script/DeployWizToken.s.sol";
import {WizToken} from "../src/WizToken.sol";

contract WizTokenTest is Test {
    WizToken public wizToken;
    DeployWizToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployWizToken();
        wizToken = deployer.run();

        vm.prank(msg.sender);
        wizToken.transfer(bob, STARTING_BALANCE);
    }

    function testbobbal() public {
        assertEq(STARTING_BALANCE, wizToken.balanceOf(bob));
    }

    function testallowanceworks() public {
        uint256 initialallowance = 1000;
        uint256 transferamt = 500;

        vm.prank(bob);
        wizToken.approve(alice, initialallowance);

        vm.prank(alice);
        wizToken.transferFrom(bob, alice, transferamt);

        assertEq(wizToken.balanceOf(alice), transferamt);
        assertEq(wizToken.balanceOf(bob), STARTING_BALANCE - transferamt);
    }
}
