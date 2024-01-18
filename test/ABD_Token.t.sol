// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "forge-std/Test.sol";
import "../src/ABD_Token.sol";

contract ABD_TokenTest is Test {
    ABD_Token token;
    address account1 = address(1);
    address account2 = address(2);

    function setUp() public {
        token = new ABD_Token(1000);
    }

    function testInitialBalanceUsingDeployer() public {
        assertEq(token.balanceOf(address(this)), 1000);
    }

    function testTransfer() public {
        token.transfer(account1, 500);
        assertEq(token.balanceOf(account1), 500);
    }

    function testFailTransferNotEnoughBalance() public {
        token.transfer(account1, 1500); // This should fail
    }

    function testApproveAndAllowance() public {
        token.approve(account1, 400);
        assertEq(token.allowance(address(this), account1), 400);
    }

    function testTransferFrom() public {
        token.approve(account1, 300);
        ABD_Token(account1).transferFrom(address(this), account2, 300);
        assertEq(token.balanceOf(account2), 300);
    }

    function testIncreaseAllowance() public {
        token.approve(account1, 200);
        token.increaseAllowance(account1, 100);
        assertEq(token.allowance(address(this), account1), 300);
    }

    function testDecreaseAllowance() public {
        token.approve(account1, 200);
        token.decreaseAllowance(account1, 100);
        assertEq(token.allowance(address(this), account1), 100);
    }
}
