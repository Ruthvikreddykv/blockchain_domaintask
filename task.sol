// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 public uintVar;
    int256 public intVar;
    bool public boolVar;
    address public addressVar;
    string public stringVar;
    bytes32 public bytes32Var;
    mapping(address => uint256) public mappingVar;
    enum Color { Red, Green, Blue }
    Color public enumVar;

    constructor() {
        uintVar = 42;
        intVar = -10;
        boolVar = true;
        stringVar = "Hello, World!";
        bytes32Var = keccak256("Solidity");
        enumVar = Color.Red;
    }

    function setUintVar(uint256 _value) public {
        uintVar = _value;
    }
   
    function setIntVar(int256 _value) public {
        intVar = _value;
    }

    function setBoolVar(bool _value) public {
        boolVar = _value;
    }

    function setAddressVar(address _value) public {
        addressVar = _value;
    }

    function setStringVar(string memory _value) public {
        stringVar = _value;
    }

    function setBytes32Var(bytes32 _value) public {
        bytes32Var = _value;
    }

    function setMappingVar(address _key, uint256 _value) public {
        mappingVar[_key] = _value;
    }

    function setEnumVar(Color _value) public {
        enumVar = _value;
    }

    function transfer(address payable _to, uint256 _amount) public {
        require(_to != address(0), "Invalid recipient address");
        require(address(this).balance >= _amount, "Insufficient balance");

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}
