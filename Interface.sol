pragma solidity ^0.8.3;

// Interface allow the contract to use other contract's code without rewrite the whole code.

interface ICounter {
    function count() external view returns (uint);
    function inc() external;
}

contract Interface {
    uint public count;
    // Need to pass the address of the contract you want to implement.
    function examples(address _counter) external {
        ICounter(_counter.inc()); // Exec inc func 
        count = ICounter(_counter.count()); // Exec count func
    }
}