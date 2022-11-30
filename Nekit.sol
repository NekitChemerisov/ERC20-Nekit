//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ERC20 {
    uint totalSupply = 1000000e18;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    string public name = "Nekit";
    string public symbol = "NE";
    uint8 public decimal = 18;

    function TotalSupply() external view returns(uint) {
        return totalSupply;
    }

    function BalanceOf(address account) external view returns(uint) {
        return balanceOf[account];
    }

    function transfer(address recipient, uint amount) external returns(bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function Allowance(address owner, address spender) external view returns(uint) {
        return allowance[owner][spender];
    }

    function mint() public {
        balanceOf[msg.sender] = 500e18;
    }

    function approve(address spender, uint amount) external returns(bool) {
        allowance[msg.sender][spender] = amount;
        emit Approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) external returns(bool) {
        allowance[sender][recipient] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }


    event Transfer(address indexed from, address  indexed to, uint amount);

    event Approve(address indexed owner, address indexed spender, uint amount);
}