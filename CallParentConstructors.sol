pragma solidity ^0.8.3;

// 2 ways to call parernt constructors
// Order of initization

contract S {
    string public name;
    constructor(string memory _name){
        name = _name;
    }
} 

contract T {
    string public text;
    constructor(string memory _text){
        text = _text;
    }
} 

contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {} // The way to pass param to parent constructors.
}

contract VV is S("S"), T {
    constructor(string memory _text) T(_text) {} // one param is fixed value
}

// Exec order S->T->V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text){ } // Order of initization
}

// Exec order S->T->V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name){ } // Inherit order impact the exec order
}

// Exec order T->S->V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_text) S(_name){ } 
}