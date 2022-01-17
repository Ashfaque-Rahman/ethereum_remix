pragma solidity ^0.5.0;

contract ArcadeToken {
    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint8 exchangeRate = 100;

    mapping (address => uint) balances;

    function balance () public view returns (uint) {
        return balances[msg.sender];
    }

    function transfer (address recipient, uint value) public{
        balances[msg.sender]-=value;
        balances[recipient]+=value;

    }

    function purchase() public payable{
        uint amount = msg.value/exchangeRate;
        balances[msg.sender]+=amount;
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint amount) public{
        require(msg.sender == owner, "You are not the owner of the contract");
        balances[recipient]+=amount;
    }
    
}
