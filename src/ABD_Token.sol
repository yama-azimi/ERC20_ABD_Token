// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

/// @title ABDToken
/// @dev Implementation of the ERC20 Token Standard for ABD Token.
contract ABD_Token {
    /// @notice ERC20 token name
    string public constant name = "ABDToken";

    /// @notice ERC20 token symbol
    string public constant symbol = "ABDT";

    /// @notice ERC20 token decimals
    uint8 public constant decimals = 18;

    /// @notice Total supply of tokens
    uint256 private _totalSupply;

    /// @notice Mapping from token holder address to their balance
    mapping(address => uint256) private _balances;

    /// @notice Mapping from token holder to another address with an allowed withdrawal amount
    mapping(address => mapping(address => uint256)) private _allowances;

    /// @notice Event emitted when tokens are transferred from one address to another
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice Event emitted when a token owner authorizes a spender
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    /// @dev Sets the total number of tokens and allocates them to the creator of the contract
    constructor(uint256 total) {
        _totalSupply = total;
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /// @return the total supply of tokens
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /// @param account The address of the token holder
    /// @return The balance of the specified address
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    /// @notice Transfers tokens to a specified address
    /// @param to The address to transfer to
    /// @param amount The amount to be transferred
    /// @return True if the transfer was successful, otherwise false
    function transfer(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "ERC20: transfer to the zero address");
        require(
            _balances[msg.sender] >= amount,
            "ERC20: transfer amount exceeds balance"
        );

        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    /// @notice Sets the allowance over the sender's tokens for the spender
    /// @param spender The address which will spend the funds
    /// @param amount The amount of tokens to be allowed
    /// @return True if the approval was successful, otherwise false
    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    /// @param owner The address which owns the funds
    /// @param spender The address which will spend the funds
    /// @return The amount of tokens still available for the spender
    function allowance(
        address owner,
        address spender
    ) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    /// @notice Transfer tokens from one address to another given the sender has enough allowance
    /// @param from The address which you want to send tokens from
    /// @param to The address which you want to transfer to
    /// @param amount The amount of tokens to be transferred
    /// @return True if the transfer was successful, otherwise false
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(
            _balances[from] >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        require(
            _allowances[from][msg.sender] >= amount,
            "ERC20: transfer amount exceeds allowance"
        );

        _balances[from] -= amount;
        _allowances[from][msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    /// @notice Increases the allowance granted to `spender` by the caller
    /// @param spender The address which will spend the funds
    /// @param addedValue The amount of tokens to increase the allowance by
    /// @return True if the operation was successful, otherwise false
    function increaseAllowance(
        address spender,
        uint256 addedValue
    ) public returns (bool) {
        require(
            spender != address(0),
            "ERC20: increase allowance for the zero address"
        );
        _allowances[msg.sender][spender] += addedValue;
        emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
        return true;
    }

    /// @notice Decreases the allowance granted to `spender` by the caller
    /// @param spender The address which will spend the funds
    /// @param subtractedValue The amount of tokens to decrease the allowance by
    /// @return True if the operation was successful, otherwise false
    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    ) public returns (bool) {
        require(
            spender != address(0),
            "ERC20: decrease allowance for the zero address"
        );
        require(
            _allowances[msg.sender][spender] >= subtractedValue,
            "ERC20: decreased allowance below zero"
        );
        _allowances[msg.sender][spender] -= subtractedValue;
        emit Approval(msg.sender, spender, _allowances[msg.sender][spender]);
        return true;
    }
}
