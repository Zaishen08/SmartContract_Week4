pragma solidity ^0.8.3;

// Require, Revert, Assert
// Gas refund, state updates are reverted
// customer error - save gas

contract ErrorTest {
    function testRequire(uint _i) public pure {
        require(_i<=10, "i>10"); // Use require to validate the condition, will return remain gas if the result is false.  
    }

    function testRevert(uint _i) public pure {
        if(_i > 10) {
           revert("i > 10"); // Similar as require but use cases is mostly in complex code
        }
    }

    uint public num = 123;

    function testAssert() public view {
        assert(num == 123); // Assert to check the condition is true. Will burn all gas when assert is false.
    }

    function foo(uint _i) public {
        num += 1;
        require(_i < 10); // the num will not added if the requre is false
    }

    error MyError(address caller, uint i); // Definded custom error 

    function textCutomerError(uint _i) public view {
        if(_i > 10) {
             revert MyError(msg.sender, _i); // Throw customer error to save the gas (less words consume less gas)
        }
    }
}