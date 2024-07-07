// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract customToken is ERC20{
	address private owner;
	
	constructor(string memory name, string memory symbol) ERC20(name, symbol) {
		owner = msg.sender;
		_mint(msg.sender, 100 * 10**uint(decimals()));
	}

	modifier onlyOwner() {
		require(msg.sender == owner, "Only owner can call this function");
		_;
	}

	function mintTo(address to, uint amount) public onlyOwner {
		_mint(to, amount);
	}
	
	function burn(uint amount) public {
		_burn(msg.sender, amount);
	}
	
	
	function transfer(address to, uint amount) public override returns(bool){
		_transfer(msg.sender, to, amount);
		return true;
	}
}
