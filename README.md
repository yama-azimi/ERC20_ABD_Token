# ABDToken - ERC20 Smart Contract

## Overview

ABDToken is a robust and feature-rich ERC20 token smart contract implemented on Sepolia testnet. Adhering strictly to the ERC20 standard, ABDToken introduces a streamlined and efficient token with standard functionalities like transfer, allowance, and balance tracking, alongside additional features for enhanced allowance management.

## Features

- **ERC20 Compliance**: Fully compliant with the ERC20 standard, ensuring compatibility with a wide range of Ethereum tools and services.
- **Immutable Contract Parameters**: Token name (`ABDToken`), symbol (`ABDT`), and decimals (`18`) are set as constants.
- **Total Supply Management**: The total supply of tokens is defined at deployment and distributed to the contract creator.
- **Balance Tracking**: Each token holder's balance is securely tracked, allowing for transparent and accurate accounting.
- **Allowance System**: Token holders can authorize third-party addresses to transfer a specific number of tokens on their behalf, providing flexibility and security in token operations.
- **Transfer Functionality**: Standard ERC20 transfer functionality is implemented, enabling token holders to send tokens directly to other addresses.
- **Approval and Allowance Management**: Functions for approving, increasing, and decreasing allowances add an extra layer of control over third-party transfers.

## Contract Functions

1. **Constructor**: Initializes the total supply and allocates it to the contract creator.
2. **totalSupply**: Returns the total supply of tokens.
3. **balanceOf**: Provides the balance of a specified address.
4. **transfer**: Enables token holders to transfer tokens to a specified address.
5. **approve**: Allows token holders to set an allowance for a third party.
6. **allowance**: Returns the amount of tokens that an owner allowed a spender.
7. **transferFrom**: Facilitates the transfer of tokens from one address to another, provided there's enough allowance.
8. **increaseAllowance** and **decreaseAllowance**: Adjusts the allowance for a third party, either increasing or decreasing it.

## How to Use

To interact with the ABDToken contract, you will need a blockchain interface like Web3.js or Ethers.js and an Ethereum wallet. Ensure you are connected to the Ethereum network where the contract is deployed.

### Basic Interaction Examples

- **Check Balance**: `balanceOf('<address>')`
- **Transfer Tokens**: `transfer('<recipient_address>', amount)`
- **Approve Allowance**: `approve('<spender_address>', amount)`
- **Increase/Decrease Allowance**: `increaseAllowance('<spender_address>', amount)` or `decreaseAllowance('<spender_address>', amount)`

## Installation and Setup

To interact with ABDToken, follow these steps:

Clone the repository: git clone https://github.com/yama-azimi/ERC20_ABD_Token.git
Install necessary dependencies (if any).

## Development and Testing

For development and testing purposes, deploy the contract on test networks like Sepolia. Utilize Foundry frameworks for deployment and testing.

## Security and Recommendations

As with any smart contract, it's crucial to audit the code for security vulnerabilities before deploying it on the mainnet.
Do not share private keys or other sensitive credentials.

## License

This project is licensed under the MIT License.

## Contact

For any inquiries or contributions, please contact me at mazimi.yama@gmail.com.
