# ABDToken - ERC20 Smart Contract

## Overview

ABDToken is a robust and feature-rich ERC20 token smart contract implemented on the Sepolia testnet. Compliant with the ERC20 standard, ABDToken offers streamlined token functionalities such as transfer, allowance, and balance tracking, along with enhanced features for effective allowance management.

## Features

- **ERC20 Compliance**: Fully adheres to the ERC20 standard for seamless compatibility with Ethereum tools and services.
- **Immutable Contract Parameters**: The token's name (`ABDToken`), symbol (`ABDT`), and decimals (`18`) are constants.
- **Total Supply Management**: Defines the total supply of tokens at deployment, distributed to the contract creator.
- **Balance Tracking**: Maintains accurate token balances for each holder, ensuring transparent transactions.
- **Advanced Allowance System**: Enables token holders to authorize third parties to transfer specified token amounts, enhancing security in token operations.
- **Efficient Transfer Functionality**: Implements standard ERC20 transfer methods, facilitating direct token transfers between addresses.
- **Robust Approval and Allowance Management**: Includes functionalities to approve, increase, and decrease allowances for controlled third-party transactions.

## Contract Functions

1. **Constructor**: Initializes total supply and allocates it to the creator.
2. **totalSupply**: Reports the total token supply.
3. **balanceOf**: Queries the balance of a given address.
4. **transfer**: Executes token transfers to specified addresses.
5. **approve**: Sets allowances for third-party transfers.
6. **allowance**: Retrieves the allowed token amount for a spender.
7. **transferFrom**: Enables third-party transfers within allowance limits.
8. **increaseAllowance** & **decreaseAllowance**: Modifies third-party transfer allowances.

## How to Use

To interact with ABDToken, use a blockchain interface like Web3.js or Ethers.js and connect to an Ethereum wallet. Ensure connectivity to the Sepolia network.

### Basic Interaction Examples

- **Check Balance**: `balanceOf('<address>')`
- **Transfer Tokens**: `transfer('<recipient_address>', amount)`
- **Set Allowance**: `approve('<spender_address>', amount)`
- **Adjust Allowance**: `increaseAllowance('<spender_address>', amount)` or `decreaseAllowance('<spender_address>', amount)`

## Installation and Setup

1. Clone the repository: `git clone https://github.com/yama-azimi/ERC20_ABD_Token.git`
2. Install dependencies: Follow instructions in the repository (if applicable).

## Development and Testing

Deploy and test the contract on networks like Sepolia for development purposes. The Foundry framework is recommended for comprehensive testing and deployment. For more information on using Foundry, refer to [Foundry Documentation](https://foundry.paradigm.xyz/).

## Security and Recommendations

- Conduct thorough audits to identify any security vulnerabilities before mainnet deployment.
- Users should perform due diligence and understand the risks before interacting with the contract.
- Avoid sharing private keys or sensitive credentials.

## Contributing

Contributions to ABDToken are welcome! Please refer to the 'Contributing Guidelines' in the repository for more details on submitting pull requests, reporting bugs, or suggesting enhancements.

## License

This project is licensed under the MIT License.

## Contact

For inquiries or contributions, please open an issue in the GitHub repository or contact me at mazimi.yama@gmail.com.
