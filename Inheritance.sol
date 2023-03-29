
pragma solidity ^0.8.3;

/*
Inheritance and override implement
*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

// Although B doesn't implement baz(), but we can found it when deploy cuz B inherit A.
contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

// C inherit B, need to add virtual on B.bar() for overrde bar()
contract C is B {
    function bar() public pure virtual override returns (string memory) {
        return "C";
    }
}