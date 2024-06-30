// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract customTokenUsingERC20 is ERC20{
	address private owner;
	
	constructor(string memory tokenName, string memory tokenSymbol, uint ownerTokens) ERC20(tokenName, tokenSymbol) {
		owner = msg.sender;
		_mint(msg.sender, ownerTokens);
	}
	
	modifier onlyOwner() {
		require(msg.sender == owner, "Only owner can call this function");
		_;
	}

	function mintTo(address recipient, uint mint_token) public onlyOwner {
		_mint(recipient, mint_token);
	}
	
	function burn(uint burn_token) public {
		_burn(msg.sender, burn_token);
	}
}
