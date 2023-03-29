pragma solidity ^0.8.3;

// How to declare a mapping (simple and nested)

contract Mapping{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend; // Nested mapping defined

    function examples() external {
        balances[msg.sender] = 123; // Set the balances of this address to 123
        uint bal = balances[msg.sender]; // Get the balances of this address
        uint bal2 = balances[address(1)]; // Address doesn't exist, the balances will be 0

        balances[msg.sender] += 456; // Aggregation calc used, origin balances(123) will plus 456

        delete balances[msg.sender];

        isFriend[msg.sender][address(this)] = true; // check bool value in nested mapping
    }
}