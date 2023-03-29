pragma solidity ^0.8.3;

// Data Locations - storage, memory and calldata

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs; // Defined a mapping the value is struct

    // Pass calldata type param and return memory type data.
    function example (uint[] calldata y, string calldata s) external returns (uint[] memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"}); // Initiated the struct

        MyStruct storage myStruct = myStructs[msg.sender]; // Storage type is for modify and store on chain.   
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender]; // Memory type live cycle will end after function call.
        myStruct.foo = 456;

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr; // Retun will be [234, 0, 0]

    }

    // Call data type is not allowed to modify.
    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }

}