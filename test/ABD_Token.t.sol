// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "forge-std/Test.sol";
import "../src/ABD_Token.sol";

/// @title ABD_TokenTest
/// @notice This contract is for testing the functionalities of the ABD_Token contract.
contract ABD_TokenTest is Test {
    ABD_Token token;
    address account1 = address(1);
    address account2 = address(2);

    /// @notice Set up the testing environment before each test.
    function setUp() public {
        // Initialize the token with a total supply of 1,000,000.
        token = new ABD_Token(1000000);
    }

    /// @notice Test the initial token balance of the deployer.
    function testInitialBalanceUsingDeployer() public {
        // Assert that the token balance of the deployer (this contract) is 1,000,000.
        assertEq(token.balanceOf(address(this)), 1000000);
    }

    /// @notice Test the transfer function of the token contract.
    function testTransfer() public {
        // Transfer 500 tokens from this contract to account1.
        token.transfer(account1, 500);
        // Assert that account1's token balance is now 500.
        assertEq(token.balanceOf(account1), 500);
    }

    /// @notice Test transfer with insufficient balance (should fail).
    function testFailTransferNotEnoughBalance() public {
        // Attempt to transfer more tokens than available in the contract's balance.
        // This test is expected to fail.
        token.transfer(account1, 1100000);
    }

    /// @notice Test the approve and allowance functionalities.
    function testApproveAndAllowance() public {
        // Approve account1 to spend 400 tokens on behalf of this contract.
        token.approve(account1, 400);
        // Assert that the allowance set for account1 is indeed 400 tokens.
        assertEq(token.allowance(address(this), account1), 400);
    }

    /// @notice Test the transferFrom function.
    function testTransferFrom() public {
        // Approve account1 to spend 300 tokens on behalf of this contract.
        token.approve(account1, 300);

        // Simulate that account1 is the sender of the next transaction.
        vm.prank(account1);
        // Perform a transferFrom operation to move 300 tokens from this contract to account2.
        token.transferFrom(address(this), account2, 300);

        // Assert that account2's token balance is now 300.
        assertEq(token.balanceOf(account2), 300);
    }

    /// @notice Test increasing the token allowance.
    function testIncreaseAllowance() public {
        // Initially approve account1 to spend 200 tokens.
        token.approve(account1, 200);
        // Increase the allowance by an additional 100 tokens.
        token.increaseAllowance(account1, 100);
        // Assert that the total allowance for account1 is now 300 tokens.
        assertEq(token.allowance(address(this), account1), 300);
    }

    /// @notice Test decreasing the token allowance.
    function testDecreaseAllowance() public {
        // Initially approve account1 to spend 200 tokens.
        token.approve(account1, 200);
        // Decrease the allowance by 100 tokens.
        token.decreaseAllowance(account1, 100);
        // Assert that the allowance for account1 is now 100 tokens.
        assertEq(token.allowance(address(this), account1), 100);
    }
}
