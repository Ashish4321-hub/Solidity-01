pragma solidity >=0.7.0 <0.9.0;
contract Coin{
    address public minter;
    mapping(address => uint)balance;
    event Sent(address from,address to,uint amount);
    constructor(){
        minter = msg.sender;
    }
    function mint(address reciever,uint amount) public{
        require(msg.sender==minter);
        balance[reciever]+=amount;
    }
    error insufficient(uint requested,uint available);

    
    function Send(address reciever,uint amount)public{
        if(amount>balance[msg.sender])
        revert insufficient({
            requested:amount,
            available:balance[msg.sender]
        });
        balance[msg.sender] -= amount;
        balance[reciever]+= amount;
        emit Sent(msg.sender,reciever,amount);
    }

}